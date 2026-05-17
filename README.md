# dotfiles_minimum

最小構成の dotfiles です。  
このリポジトリでは `gdb` 用の共通設定を `gdbinit` として管理し、`install.sh` で `~/.gdbinit` にシンボリックリンクします。

## セットアップ

```bash
cd <repo-directory>
./install.sh
```

## gdb のインストール

OS 側で `gdb` を入れてください。

- Ubuntu/Debian: `sudo apt install -y gdb`
- Fedora/RHEL: `sudo dnf install -y gdb`
- Arch: `sudo pacman -S --noconfirm gdb`
- macOS(Homebrew): `brew install gdb`

## C/C++ をデバッグ向けにビルドする

`-g -O0` を付けてビルドします（`aliases` に `ccdbg` / `cxxdbg` あり）。

```bash
# C
ccdbg main.c -o a.out

# C++
cxxdbg main.cpp -o a.out
```

## gdb の起動

```bash
gdb ./a.out
```

引数を渡す場合:

```bash
gdb --args ./a.out arg1 arg2
```

## よく使う gdb コマンド

- `b main` : ブレークポイント設定
- `run` : 実行
- `next` : ステップオーバー
- `step` : ステップイン
- `finish` : 現在の関数を抜ける
- `bt` : バックトレース
- `p <expr>` : 変数/式を表示
- `info locals` : ローカル変数表示
- `c` : 続行
- `q` : 終了

## Neovim 連携について

現状の Neovim 設定は `codelldb` の自動インストールまで対応しています。  
`gdb` の DAP 連携は未設定のため、必要なら別途 DAP プラグインと `gdb` アダプタ設定を追加してください。
