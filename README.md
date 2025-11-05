# My Emacs Configuration

 Assumes Fedora || NixOS.

## Dependencies

### Utils
#### Direnv
For Fedora:
```bash
 sudo dnf install direnv
```
#### Ripgrep
For Fedora:
```bash
 sudo dnf install ripgrep
```
### Fonts
 * [0xProto Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip).

For Fedora (Workstation) use this to install the fonts:

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip && \
     unzip 0xProto.zip -d 0xProto && \
     sudo mv 0xProto /usr/share/fonts/ && \
     rm -rf 0xProto.zip

```

### Languages
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
 * Set up development environment `opam install ocaml-lsp-server odoc ocamlformat utop ocaml-dune`.
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
Python is already installed on your system (probably).So just install pip
```bash
sudo dnf install pip
```
#### LaTeX
For installing latex I do:
```bash
sudo dnf install texlive-scheme-full
```
Its around *5GiB*, so it might take a while. 
This also includes `dvisvgm` for org-latex previewing. 
### Email
 * Install isync.
   - Create `~/.mbsyncrc`.
   - Run `mbsync -n hostinger`.
 * Install notmuch.
   - Run the interactive `notmuch setup`.
   - Run `notmuch new` to index the existing mail.
 * Install msmtp
   - Create ~/.config/msmtp/config
### Spell Checking
First install the actual spellchecker, hunspell.
```bash
sudo dnf install hunspell
```
Then the dictionaries:
```bash
sudo dnf install hunspell-en hunspell-el
```
## Install || Update

### Emacs Client
Depending on the rest of the system you will want to 
somehow autostart `emacsclient`. I just use `systemd`.
Then because I use gnome I write a `Desktop Entry` under
`~/.local/share/applications/emacsclient.desktop`:
```bash
[Desktop Entry]
Name=Emacs Client
GenericName=Text Editor
Comment=Edit text
Exec=emacsclient -c -a ""
Icon=emacs
Terminal=false
Type=Application
Categories=Utility;TextEditor;Development;Mail;
```
Finally I restart the GNOME desktop database to make sure the entry
"Emacs Client" shows up on search results.
```bash
update-desktop-database ~/.local/share/applications
```

### Cloning, Pulling.
