# README

### Emacs Mac Port (EMP)

mac用のEmacs。通常のEmacsをインストールすると日本語入力時に画面が常にフラッシュしてしまう問題があるため、EMPを入れる。

https://github.com/railwaycat/homebrew-emacsmacport

### ripgrep

`C-l C-r`にripgrepをバインドしているため、インストールしておく。

https://github.com/BurntSushi/ripgrep

```sh
brew install ripgrep
```

### フォント

Source Han Code JP というフォントを利用している。

https://github.com/adobe-fonts/source-han-code-jp

下記を実行することで、フォントをインストールすることができる。

```sh
cmd/install-font
```

### LSPモード

LSPサーバーはDockerで構築するようにしてある。

下記を参照し、各プロジェクトごとにLSPサーバー用の設定ファイルとDockerイメージを作成すること。

https://github.com/emacs-lsp/lsp-docker?tab=readme-ov-file#registering-a-language-server-using-a-persistent-configuration-file

lsp-dockerの設定ファイルをGit管理しない場合は`~/.config/git/ignore`か`<PROJECT_ROOT>/.git/info/exclude`に下記を記載する。

```
.lsp-docker
```

LSPモードを起動する際は `M-x lsp-docker-start` で手動で起動する形にしている。

ただし、そのプロジェクトを初めて開く際は `M-x lsp-workspace-folders-add` でプロジェクトルートを追加する必要がある。
