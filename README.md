# My Emacs Configuration

 Assumes Fedora.

## Dependencies

### Fonts
 * [0xProto Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip).

For Fedora (Workstation) use this to install the fonts:

```bash

```

### Languages
#### General
##### CMake
##### Nix
##### Terraform
##### Dockerfile
#### Rust
 * Install [Rust Toolchain](https://rust-lang.org/learn/get-started/) 
	 `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`.
 * Install [rust-analyzer](https://github.com/rust-lang/rust-analyzer) `rustup component add rust-analyzer`.
 * Install rust-src `rustup component add rust-src`.
 * Install rustfmt `rustup component add rustfmt`.
 * Install clippy `rustup component add clippy`. 
#### OCaml
 * Install [OCaml toolchain](https://ocaml.org/install#linux_mac_bsd) 
	 `bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"`.
 * Initialize the opam package manager `opam init`.
 * (Optional ) Activate opam switch `eval $(opam env)` (It will probably prompt when you opam init.).
 * Set up development environment `opam install ocaml-lsp-server odoc ocamlformat utop`.
#### Haskell (Cabal)
 * Install [the Haskell toolchain](https://www.haskell.org/get-started/#ghcup-universal-installer) 
	 `curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh`.
 * The rest of the install is interactive (lol).
#### GCC
GCC is a complete toolchain that also comes with language implementations, so:
 * For Fedora just install the appropriate groups `dnf group install c-development development-tools`.
#### Clang
Clang is a complete toolchain that also comes with language implementations, so:
 * For Fedora just install the appropriate binaries 
	 `dnf install clang clang-tools-extra lld lldb llvm llvm-devel`.

The `clang-tools-extra` package should provide the clangd LSP server.
#### Python
   
### Email

## Install || Update
