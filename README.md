# dotfiles
[macOS] dotfiles

## Terminal Keybindings

#### skhd

- alt + j: focus south window
- alt + k: focus north window
- alt + h: focus west window
- alt + l: focus east window

- alt + s: focus west display
- alt + g: focus east display

- shift + alt + r: rotate clockwise
- shift + alt + y: flip along y-axis
- shift + alt + x: flip along x-axis
- shift + alt + t: toggle window float

- shift + alt + m: toggle maximize
- shift + alt + e: equalize windows

- shift + alt + j: swap south
- shift + alt + k: swap north
- shift + alt + h: swap west
- shift + alt + l: swap east

- ctrl + alt + j: move and split south
- ctrl + alt + k: move and split north
- ctrl + alt + h: move and split west
- ctrl + alt + l: move and split east

- shift + alt + s: move window to left display
- shift + alt + g: move window to right display

- shift + alt + p: move window to previous space
- shift + alt + n: move window to next space

- shift + alt + 1: move window to space 1
- shift + alt + 2: move window to space 2
- shift + alt + 3: move window to space 3
- shift + alt + 4: move window to space 4
- shift + alt + 5: move window to space 5
- shift + alt + 6: move window to space 6
- shift + alt + 7: move window to space 7
- shift + alt + 8: move window to space 8
- shift + alt + 9: move window to space 9

- shift + ctrl + 1: focus space 1
- shift + ctrl + 2: focus space 2
- shift + ctrl + 3: focus space 3
- shift + ctrl + 4: focus space 4
- shift + ctrl + 5: focus space 5
- shift + ctrl + 6: focus space 6
- shift + ctrl + 7: focus space 7
- shift + ctrl + 8: focus space 8
- shift + ctrl + 9: focus space 9

- shift + ctrl + q: focus previous space
- shift + ctrl + q: focus next space

- ctrl + alt + q: quit yabai
- ctrl + alt + s: start yabai
- ctrl + alt + r: restart yabai



## Neovim Keybindings

#### keymaps.lua

- jk: while in insert mode, exit insert mode
- [leader]nh: clear search highlights
- [leader]+: increment
- [leader]-: decriment

- [leader]sv: split window vertically
- [leader]sh: split window horizontally
- [leader]se: equalize windows sizes
- [leader]sx: close current split window

- [leader]to: open new tab
- [leader]tx: close current tab
- [leader]tn: next tab
- [leader]tp: previous tab
- [leader]tf: duplicate tab

#### lazy.nvim

- :Lazy: opens lazy.nvim

#### vim-tmux-navigator
- ctrl + h: move to left tab
- ctrl + j: move to bottom tab
- ctrl + k: move to top tab
- ctrl + l: move to right tab

#### NvimTree

- [leader]ee: toggle file explorer
- [leader]ef: toggle file explorer on current file
- [leader]ec: collapse file explorer
- [leader]er: refresh file explorer

#### Telescope.nvim

- [leader]ff: find files
- [leader]fr: find recent 
- [leader]fs: find string
- [leader]fc: find string under cursor
- [leader]ft: find todos
- ctrl + o: go backwards history
- ctrl + i: go forwards history

#### auto-session

- :qa: quit all
- [leader]wr: workspace restore
- [leader]ws: workspace save

#### treesitter

- ctrl + space: select parent node
- backspace: unselect parent node

#### nvim-cmp

- ctrl + j: move down a suggestion
- ctrl + k: move up a suggestion
- ctrl + b: scroll down preview
- ctrl + f: scroll up preview
- ctrl + space: open suggestion window
- ctrl + e: close suggestion window

#### Comment.nvim

- gc+[motion]: toggle comment

#### todo-comments

- ]t: jump to next todo
- [t: jump to previous 

#### substitute.nvim

- s[motion]: substitute with motion
- ss: substitute current line
- S: subsitute to end of line
- s: while in visual mode, subsitute selected

#### nvim-surround

- ys[motion][tag]: surrounds selected with specified tag
	- ex: ysiw": surrounds word with double quotes
	- ex: ysiwt: surrounds word with specified tag
- ds[tag]: deletes surrounding tag
	- ex: ds": deletes surrounding double quotes
	- ex: dst: deletes surrounding specified tag
- cs[old_tag][new_tag]: replaces old tag with new tag
	- ex: cs'": replaces single quote with double quote
	- ex: cst: replaces surrounding specified tag

#### Mason

- :Mason: open Mason GUI ('i' to install LSPs)

#### nvim-lsp

- gR: show references
- gD: show declaration
- gd: show definitions
- gi: show implementations
- gt: show type definitions
- v: display code actions
- [leader]rn: smart rename
- [leader]D: show buffer diagnostics
- [leader]d: show line diagnostics
- [d: go to previous diagnostic
- ]d: go to next diagnostic
- K: show documentation under cursor
- [leader]rs: restart LSP

#### trouble

- [leader]xw: toggle Trouble diagnostics
- [leader]xd: toggle Trouble diagnostics filter
- [leader]xq: toggle Trouble quickfix
- [leader]xl: toggle Trouble loclist
- [leader]xt: toggle Trouble todo

#### conform

- [leader]fm: format file

#### gitsigns

- [h: Go previous hunk
- ]h: Go next hunk
- [leader]hs: stage hunk
- [leader]hr: reset hunk
- [leader]hS: Stage buffer
- [leader]hR: Reset buffer
- [leader]hu: Undo stage hunk
- [leader]hp: Preview hunk
- [leader]hb: blame line
- [leader]hB: toggle line blame
- [leader]hd: diff

## Notes

- in lua/plugins.colorscheme.lua, can change scheme style from "night" to "moon"
- lazy.nvim change_detection is set to false
- include language parsers in treesitter.lua
- inlclude lsp servers in mason.lua
- if comments aren't working properly for a particular file type, look into adding a pre-hook in comment.lua
- lspconfig.lua declares which LSP is used for the specified filetypes (mason_lspconfig.setup_handlers)
- formatters are set in formatting.lua ; will need to update mason.lua to ensure formatters are auto-installed (mason_tool_installer.setup)
- linters are set in linters.lua ; will need to udpate mason.lua to ensure linters are auto-installed (mason_tool_installer.setup)


- in general, it's best to use homebrew (or some package manager) to install programs/tools/etc.

## Resources

- https://www.josean.com/posts/yabai-setup
- https://www.josean.com/posts/how-to-setup-neovim-2024
- https://github.com/FelixKratz/SketchyBar
- https://github.com/FelixKratz/dotfiles
