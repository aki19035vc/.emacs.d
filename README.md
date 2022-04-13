# README.md
## Emacsのインストール
### Emacs Mac Port (EMP)
- https://github.com/railwaycat/homebrew-emacsmacport
- mac用のemacsです
- 通常のemacsをインストールすると、日本語入力時に画面が常にフラッシュしてしまうため、EMPを入れましょう

## その他必要なモノ
### font
`brew cask install font-source-code-pro`

### ripgrep(音速grep)
`brew install ripgrep`

### yajade
- https://github.com/kuanyui/yajade-mode.el
- とある方がmmm-modeに対応させたjade/pug-modeを開発していたので、使わせて頂いております
- `git clone https://github.com/kuanyui/yajade-mode.el ~/.emacs.d/share/github/yajade-mode`

### language
#### Ruby
- `solargraph`はRuby用のlanguage-serverです
- rubocopでのコードチェックをしてくれるので便利
- Gemfileに下記を追記し、`bundle install`しましょう
- `gem install solargraph`

#### javascript
- 開発ディレクトリのeslintを使うためにeslint-cliをインストール
- `yarn global add eslint-cli`


## Tips
### 検索
### magit
- ファイル単位のコミット履歴: magit-log-buffer-file
- ファイルの行単位のコミット履歴: magit-blame 

### 矩形編集
### 文字を大きくする
C-x C-0 => + or - or 0
