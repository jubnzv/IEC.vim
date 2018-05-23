# IEC.vim

Vim mode for editing source code files for [IEC 61131-3](https://en.wikipedia.org/wiki/IEC_61131-3) textual programming languages: [Structured Text](https://en.wikipedia.org/wiki/Structured_text) and [Instruction List](https://en.wikipedia.org/wiki/Instruction_list).

This plugin primarily designed to use with [matiec](https://github.com/sm1820/matiec) compiler.

# Screenshot

Here is an example in URxvt with [gruvbox](https://github.com/morhetz/gruvbox) color scheme:

![Screenshot](screenshot.png)

# Installation

To install with vim/neovim [plug-vim](https://github.com/junegunn/vim-plug) add following line in your configuration file:

```
Plug 'https://github.com/jubnzv/IEC.vim.git'
```

# Usage

## Matiec integration

To translate current IEC source file to C directly from vim using matiec:
```
:make %<
```

You could configure path to matiec installation directory with `matiec_path` variable. For example:
```
let matiec_path = '/home/jubnzv/.local/opt/matiec/'
```

See `:help` for more configuration options.

# License

See [LICENSE](LICENSE) file.
