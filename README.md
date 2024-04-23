# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Remove copilot and copilot-chat plugins on windows:
```bash
Remove-Item $env:LOCALAPPDATA\nvim\lua\plugins\copilot.lua -Recurse -Force
Remove-Item $env:LOCALAPPDATA\nvim\lua\plugins\copilot-chat.lua -Recurse -Force
```

Install neovim config on windows (powershell)
```bash
git clone --depth 1 https://github.com/wojtek0123/neovim-config $env:LOCALAPPDATA\nvim
nvim
```

Install neovim config on mac
```bash
git clone --depth 1 https://github.com/wojtek0123/neovim-config ~/.config/nvim
nvim
```
