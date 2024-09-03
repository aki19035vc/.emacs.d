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

steepを使用する場合はプロジェクトルートに`.dir-local`を配置し、下記を追記すること。

```
((nil . ((lsp-steep-enable . t))))
```
