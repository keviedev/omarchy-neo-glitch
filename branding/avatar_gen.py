#!/usr/bin/env python3
"""Generate neo-glitch GitHub avatar from the user's skull ASCII art."""
import numpy as np
from PIL import Image, ImageFilter

# ---- palette ----
VOID      = (10, 6, 18)       # 0a0612
GREEN     = (0, 255, 159)     # 00ff9f
CYAN      = (0, 229, 255)     # 00e5ff
MAGENTA   = (234, 0, 217)     # ea00d9
DARK_FG   = (122, 107, 154)   # 7a6b9a  (muted purple)

# ---- ASCII intensity map (same as background gen) ----
RAMP = {" ": 0.0, "░": 0.25, "▒": 0.5, "▓": 0.75, "█": 1.0}
# every block char carries one light shade too; combine: (light+dark)/2
LIGHT = {" ": 0.0, "░": 0.25, "▒": 0.5, "▓": 0.75, "█": 1.0}

SRC = "/home/soulkiller/Documents/neo-glitch.txt"
lines = [l.rstrip("\n") for l in open(SRC).read().splitlines()]
lines = [l for l in lines if l.strip()]  # drop empties, keep aspect dense

H = len(lines)
W = max(len(l) for l in lines)

# character -> (dark coverage, light coverage) per glyph cell
def glyph_densities(ch):
    dark = RAMP.get(ch, 0.0)
    light = LIGHT.get(ch, 0.0)
    return (dark + light) / 2.0

dens = np.zeros((H, W), dtype=np.float32)
for y, line in enumerate(lines):
    for x, ch in enumerate(line):
        dens[y, x] = glyph_densities(ch)

print(f"art grid: {W}x{H}")

# ---- render at cell 1:2 aspect (terminal look), big scale ----
CELL_W, CELL_H = 24, 48          # 1:2 aspect
PAD = 6                          # empty cols around art
canvas_w = (W + 2 * PAD) * CELL_W
canvas_h = H * CELL_H
S = 4                            # supersample factor
ss_w, ss_h = canvas_w * S, canvas_h * S

# base intensity image (supersampled, smooth for crisp edges)
intens = np.kron(dens, np.ones((CELL_H * S, CELL_W * S), dtype=np.float32))
img_h, img_w = intens.shape

# ---- color: vertical gradient green (top) -> cyan (mid) -> magenta (bottom) ----
t = np.linspace(0, 1, img_h, dtype=np.float32)[:, None]
stops = np.array([GREEN, CYAN, MAGENTA], dtype=np.float32)
pos = np.array([0.0, 0.55, 1.0], dtype=np.float32)
rgb = np.zeros((img_h, 3), dtype=np.float32)
for i in range(len(stops) - 1):
    m = (t[:, 0] >= pos[i]) & (t[:, 0] <= pos[i + 1])
    f = ((t[:, 0][m] - pos[i]) / (pos[i + 1] - pos[i]))[:, None]
    rgb[m] = stops[i][None, :] * (1 - f) + stops[i + 1][None, :] * f
rgb = rgb[:, None, :].repeat(img_w, axis=1)

# ---- glow layers ----
glow_color = np.array(DARK_FG, dtype=np.float32)  # ghost purple

# 1) main neon fill: bright color where density high
#    plus soft inner falloff via blur of density
from scipy.ndimage import gaussian_filter
d_soft = gaussian_filter(intens, sigma=S * 6.0)

# 2) ghost: big blurred copy offset down-left, drawn behind
ghost_int = gaussian_filter(intens, sigma=S * 14.0)
oy, ox = 5 * S, -6 * S   # down-left offset (ghost direction from background art)
shifted = np.zeros_like(ghost_int)
src_y = slice(max(0, oy), img_h + min(0, oy))
src_x = slice(max(0, ox), img_w + min(0, ox))
dst_y = slice(max(0, -oy), img_h - max(0, oy))
dst_x = slice(max(0, -ox), img_w - max(0, ox))
shifted[dst_y, dst_x] = ghost_int[src_y, src_x]

# ---- compose: void bg + ghost + neon skull ----
out = np.zeros((img_h, img_w, 3), dtype=np.float32)
out += VOID

# ghost layer (magenta tint for the classic neo-glitch ghost)
ghost_rgb = np.array(MAGENTA, dtype=np.float32)
g = shifted[:, :, None] * ghost_rgb[None, None, :]
out += g * 0.35

# neon skull: sharp core + soft bloom
core = intens[:, :, None] * rgb
bloom = d_soft[:, :, None] * rgb
out = out + bloom * 0.55 + core * 1.15

# ---- glitch: horizontal slice offsets on the final ----
out = np.clip(out, 0, 255)
rng = np.random.default_rng(42)

# scanlines (subtle darkening every other ss-row)
scan = np.ones((img_h, 1, 1), dtype=np.float32)
scan[::2 * S] = 0.88
out *= scan

glitched = out.copy()
# a few RGB-channel displaced slices
n_slices = 7
for _ in range(n_slices):
    y0 = rng.integers(0, img_h - 8 * S)
    h = rng.integers(2 * S, 10 * S)
    dx = rng.integers(-10 * S, 10 * S)
    y1 = min(img_h, y0 + h)
    sl = glitched[y0:y1]
    shifted_sl = np.roll(sl, dx, axis=1)
    # chromatic aberration on this slice: R to left, B to right
    if dx >= 0:
        glitched[y0:y1, :, 0] = np.roll(sl[:, :, 0], dx + 3 * S, axis=1)
    else:
        glitched[y0:y1, :, 2] = np.roll(sl[:, :, 2], dx - 3 * S, axis=1)
    glitched[y0:y1, :, 1] = shifted_sl[:, :, 1]

out = np.clip(glitched, 0, 255).astype(np.uint8)

img = Image.fromarray(out, "RGB")
# downscale (supersample AA) then square-crop & resize for GitHub
img = img.resize((canvas_w, canvas_h), Image.LANCZOS)

sq = min(canvas_w, canvas_h)
# center square crop
left = (canvas_w - sq) // 2
top = (canvas_h - sq) // 2
img = img.crop((left, top, left + sq, top + sq))

img = img.resize((1024, 1024), Image.LANCZOS)
img.save("/tmp/opencode/avatar-1024.png")
img.resize((256, 256), Image.LANCZOS).save("/tmp/opencode/avatar-256.png")
img.resize((64, 64), Image.LANCZOS).save("/tmp/opencode/avatar-64.png")
print("saved avatar-1024 / 256 / 64")