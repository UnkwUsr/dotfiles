# development/programming tools

## tools
AddPackage clang # C language family frontend for LLVM
AddPackage gcc # The GNU Compiler Collection - C and C++ frontends
AddPackage mold # A Modern Linker
AddPackage lldb # Next generation, high-performance debugger
AddPackage cmake # A cross-platform open-source make system
AddPackage ctags # Generates an index file of language objects found in source files
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-compose # Fast, isolated development environments using Docker
AddPackage distrobox # Use any linux distribution inside your terminal.
AddPackage --foreign ida-free # Freeware version of the world's smartest and most feature-full disassembler
AddPackage --foreign rust-pseudo-package # Rust pseudo package that provides rust and cargo to build anthing from aur while you have installed rustup

## utils
AddPackage diff-so-fancy # Good-looking diffs with diff-highlight and more
AddPackage difftastic # An experimental diff tool that compares files based on their syntax
AddPackage binutils # A set of programs to assemble and manipulate binary and object files
AddPackage --foreign detect-it-easy-bin # Detect It Easy, or abbreviated "DIE" is a program for determining types of files
AddPackage --foreign xxd-standalone # Hexdump utility from vim
# AddPackage --foreign snoopy-logger # A small library that logs all program executions

## language servers
AddPackage lua-language-server # Lua Language Server coded by Lua
AddPackage stylua # Code formatter for Lua
AddPackage bash-language-server # Bash language server implementation based on Tree Sitter and its grammar for Bash
AddPackage shellcheck # Shell script analysis tool
AddPackage shellharden # Bash linter and syntax highlighter
AddPackage markdownlint-cli # MarkdownLint Command Line Interface
AddPackage python-lsp-server # Fork of the python-language-server project, maintained by the Spyder IDE team and the community
AddPackage python-lsp-black # python-lsp-server plugin that adds support to black autoformatter, forked from pyls-black
AddPackage python-pylint # Analyzes Python code looking for bugs and signs of poor quality
AddPackage python-rope # Refactoring library
AddPackage python-pyflakes # A lint-like tool for Python to identify common errors quickly without executing code
AddPackage --foreign python-flake8-bugbear # Plugin for Flake8 finding likely bugs and design problems in your program
AddPackage yapf # Python style guide checker
AddPackage typescript-language-server # Language Server Protocol (LSP) implementation for TypeScript using tsserver
AddPackage deno # A secure runtime for JavaScript and TypeScript
AddPackage vscode-css-languageserver # CSS/LESS/SCSS language server
AddPackage vscode-html-languageserver # HTML language server
AddPackage tidy # A tool to tidy down your HTML code to a clean style
AddPackage prettier # An opinionated code formatter
# AddPackage pgformatter # A PostgreSQL SQL syntax beautifier

# this used now for installing python package for speech recognition script (in
# gather_inbox.sh), but also turned out it is nice tool for python
AddPackage uv # An extremely fast Python package installer and resolver written in Rust
