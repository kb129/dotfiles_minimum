# CLAUDE.md

このリポジトリは個人のドットファイルを管理する。`install.sh` / `install.force.sh` が各設定ファイルを `$HOME` 以下へシンボリックリンクする。

## 運用ルール

- **このファイルは随時更新すること。** 新しい作業ルールやプロジェクト固有の decision が発生したら、そのつどここに追記する。

## nvim キーマップ変更時の手順

`nvim/lua/keymaps.lua` などnvimのキーマップを追加・変更する際は、必ず以下の手順を踏む。

1. 対象の操作について、一般的・標準的なキーバインドの慣習を調べる(Vim/Neovim標準、関連プラグインでの一般的な慣習など)。
2. 現在の設定(`nvim/lua/keymaps.lua`, `nvim/lua/coc.lua`, `nvim/lua/plugins.lua` 内のプラグイン独自マッピング等)と競合しないか確認する。
3. 「一般的な慣習 vs 今回提案するキーマップ」を比較して提示し、競合があれば必ず伝える。
4. ユーザーの承認を得てから実装する。
5. 実装したら `nvim/README.md` の「キーマップ」セクションに追記し、ドキュメントとして残す。

## ディレクトリ構成

```
.
├── install.sh / install.force.sh   # シンボリックリンクの設置/削除
├── aliases, bashrc, bash_profile, zshrc, zpreztorc, tmux.conf, screenrc
└── nvim/
    ├── init.lua, lazy-lock.json, README.md
    └── lua/{autocmds,coc,colorscheme,keymaps,options,plugins}.lua
```
