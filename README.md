# README.md
## Emacsのインストール
### Emacs Mac Port (EMP)
- https://github.com/railwaycat/homebrew-emacsmacport
- mac用のemacsです
- 通常のemacsをインストールすると、日本語入力時に画面が常にフラッシュしてしまうため、EMPを入れましょう

### All the icons のインストール
```
M-x all-the-icons-install
```

## その他必要なモノ
### font
`brew cask install font-source-code-pro`

### ripgrep(音速grep)
`brew install ripgrep`

### yajade
- https://github.com/kuanyui/yajade-mode.el
- とある方がmmm-modeに対応させたjade/pug-modeを開発していたので、使わせて頂いております
- `git clone https://github.com/kuanyui/yajade-mode.el ~/.emacs.d/share/github/yajade-mode`

### digdag

```
git clone git@github.com:syohex/emacs-digdag-mode.git ~/.emacs.d/share/github/emacs-digdag-mode
```

### language
#### Ruby
`solargraph`はRuby用のlanguage-serverです。
現在は、グローバルにインストールして使用しています。
```
$ gem install solargraph
$ solargraph config
```

#### Python

```
pip install 'python-lsp-server[all]'
```

#### JavaScript
- 開発ディレクトリのeslintを使うためにeslint-cliをインストール
- `yarn global add eslint-cli`

#### Scala
[coursier](https://get-coursier.io/docs/cli-installation) を使用してScalaの開発環境を整えます。
※ Xcode及びCommandLineToolsのバージョンが足りない場合はアップデートしてください

```
$ brew install coursier
$ cs setup
```

setup後、scalaのバージョンを指定してインストール&有効にすることができます。

```
# cs install scala:<version>
$ cs install scala:2.13.8
```

同様にJVMもバージョン管理することができるようです。
詳しくは公式ドキュメントを参照してください。

下記でLanguageServerをインストールしてください。
[Metals公式ドキュメント](https://scalameta.org/metals/docs/editors/emacs/)

```
$ cs install metals
```

プロジェクトを開いて`Import build`を選択後、プロジェクトのビルドに数分待ちます。
ログは下記でリアルタイムに確認できます。

```
$ tail -f .metals/metals.log
```

## Tips
### 検索
### magit
- ファイル単位のコミット履歴: magit-log-buffer-file
- ファイルの行単位のコミット履歴: magit-blame 

### 矩形編集
### 文字を大きくする
C-x C-0 => + or - or 0
