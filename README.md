# Neo Glitch — an Omarchy theme

Cyberpunk glitch aesthetics for [Omarchy](https://omarchy.org): RGB-split neon
on void black. Hacker deck, netrunner vibes.

![Neo Glitch](preview.png)

## Install

```bash
omarchy theme install https://github.com/keviedev/omarchy-neo-glitch.git
omarchy theme set neo-glitch
```

## What's inside

- **colors.toml** — the palette. Void black (`#0a0612`) base with neon green
  (`#00ff9f`), cyan (`#00e5ff`), magenta (`#ea00d9`), red (`#ff2a6d`), and
  yellow (`#f9f871`). Everything below derives from it where Omarchy allows.
- **backgrounds/** — five procedurally generated synthwave glitch cities
  (2560x1440): segmented neon sun, perspective grid, digital rain, RGB
  channel-split shearing, CRT scanlines — plus a dead-face (😵) variant
  where the sun is a neon-green double-X smiley with a magenta ghost copy,
  and a modified variant with the eyebrows erased and a tongue sticking
  out. Generated with PIL, no AI, no scraping. `omarchy theme bg next`
  cycles them.
- **ghostty.conf** — reference terminal palette (magenta selection, red
  cursor). Repo-installed themes get this regenerated from `colors.toml`
  (see Notes).
- **btop.theme** — glitch-styled system monitor: per-subsystem neon box
  colors, magenta download / cyan upload graphs.
- **hyprlock.conf** — supplies the lock screen variable colors (black ICE
  input field, magenta frame, green text).
- **hyprland.conf** — focused-window border gradient: green → magenta at 90°.
- **shell.\*.toml** — Omarchy shell section overrides: translucent black bar,
  hot magenta interactive controls, gradient-framed launcher/menus/popups/
  notifications, neon lock input.
- **keyboard.rgb / icons.theme** — neon green keyboard backlight (OpenRGB
  devices), Yaru-purple icons.
- **gedit-neo-glitch.xml** — optional GtkSourceView scheme for gedit 50
  (libgedit-gtksourceview-300). Drop it in
  `~/.local/share/libgedit-gtksourceview-300/styles/` and select
  "Neo Glitch".
- **neo-glitch.nvim/** — a full matching Neovim colorscheme (void black,
  neon syntax, green cursor on purple CursorLine). Point your LazyVim at it:
  ```lua
  { dir = "~/path/to/omarchy-neo-glitch/neo-glitch.nvim", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "neo-glitch" } },
  ```
- **fastfetch/** — a matching fastfetch config: truecolor dead-face (😵)
  ASCII logo rendered from Noto Color Emoji, neon RGB key colors
  (magenta hardware / cyan software / red system headers). Copy
  `fastfetch/config.jsonc` to `~/.config/fastfetch/config.jsonc` and
  `fastfetch/dead-face.txt` to `~/.config/fastfetch/neo-glitch/`.

## Starship prompt

A matching `neo-glitch` starship palette (magenta → red → cyan → green →
yellow segments on void black) is in [starship-palette.toml](starship-palette.toml).
Drop the palette block into `~/.config/starship.toml` and set
`palette = 'neo-glitch'`. Segment structure inspired by
[Deoxizn's omarchy-space-bound-theme](https://github.com/Deoxizn/omarchy-space-bound-theme)
— thanks for the inspiration, Devi!

## Notes

- `omarchy theme install` regenerates terminal configs and Lua from
  `colors.toml` (themes cloned from a repo can't ship code), so the custom
  ghostty palette is applied via your own ghostty config:
  `config-file = "~/.local/state/omarchy/current/theme/ghostty.conf"`.
- The preview and backgrounds are PNG, generated locally with
  Pillow — regenerate with a different seed for new city variants.

## Credits

- Starship prompt segment structure inspired by
  [omarchy-space-bound-theme](https://github.com/Deoxizn/omarchy-space-bound-theme)
  by **Devi** (Deoxizn).

## License

MIT