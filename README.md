# README.md
## Emacsのインストール
### Emacs Mac Port (EMP)
[https://github.com/railwaycat/homebrew-emacsmacport]
- nmac用のemacsです。
- 通常のemacsをインストールすると、日本語入力時に画面が常にフラッシュしてしまうため、EMPを入れましょう

## その他必要なモノ
### font
`brew cask install font-source-code-pro`

### ripgrep(音速grep)
`brew install ripgrep`

### yajade [github](https://github.com/kuanyui/yajade-mode.el)
- とある方がjade-modeをmmm-modeに対応させていたので使わせて頂いております
- `git clone https://github.com/kuanyui/yajade-mode.el ~/.emacs.d/share/github/yajade-mode`

### language
#### Ruby
- bundler経由で呼び出されるため、bundler必須
- solargraphはrubocopでのコードチェックをしてくれる
  - lsp-modeではflychecckのチェッカーにrubocopを指定して起動される。便利
- `gem install bunlder`
- `bundle install solargraph`

#### javascript
- 開発ディレクトリのeslintを使うためにeslint-cliをインストール
- `yarn global add eslint-cli`

## 設定
ファイルの分け方はspacemacsを参考にしています

### base
[設定]
[パッケージ]
- exec-path-from-shell
- popup
- popwin
- which-key

- magit :: gitクライアント
- projectile :: gitリポジトリ上のファイルを簡単に探せたりするやつ
- elscreen or eyebrowse (タブ化)


### misc
[設定]
- スクロール関数の再定義(自作)
- 画面分割後にbalanceを取る(自作)

### completion
- ivy
- swiper
- consel (find-file, kill-ring)
- ivy-rich (all-the-icons)


### auto-complete
- company
- company-box :: アイコンを設定してくれる
- company-posframe :: companyをposframeで表示してくる

### ui
- メニューバー非表示
- ツールバー非表示
- スクロールバー非表示
- フリンジの幅の右側を削除
- 行番号表示
- font
- spacemacs-theme
- doom-modeline

[wip]
- hide-mode-line (不要なモードラインを消す。neotreeなど)
- neotree

### lsp
- lsp-mode

### better-default
- mwim :: C-a/C-eをより使いやすくする

[todo]
- unfill :: M-q の拡張 (文章を適切な位置で改行/元に戻す)

### editing
[パッケージ]
- expand-region :: regionを自動で広げていってくれる。これないとやってけない
- hungry-delete :: backspace, delete の時、前後に不要な空白を削除する
- smartparens :: 範囲選択後、任意の括弧の先頭文字を入力すると、前後に括弧を挿入する機能
- undo-tree :: redoが使えるようになる。それ以外の機能はおまけ

[todo]
- yasnipet
- 矩形編集

[おまけ]
- aggressive-indent :: 強制インデント (デフォルトのelectric-indent-modeより信頼出来るらしい)
- avy :: 画面上の文字に移動する
- clean-aindent-mode :: 未使用の空白を削除する、自動インデント機能
- move-text :: カーソル行、選択範囲を上下に移動させる (M-up, M-down)
- origami :: lisp系言語、C系言語の関数部分の折りたたみ機能

### editing-visual
[設定] http://keisanbutsuriya.hateblo.jp/entry/2015/02/01/162035
- 現在行のハイライト
- 対応する括弧のハイライト
- 括弧のハイライト設定
- 選択範囲をハイライト

[パッケージ]
- auto-hilight-symbol
- highlight-numbers :: 数字をハイライト
- highlight-indent-guides :: インデントをハイライトしてくれる [https://github.com/DarthFennec/highlight-indent-guides]
- rainbow-delimiters :: 括弧をレインボーにする
- volatile-highlights :: yank(貼り付け)やundoした時にハイライトしてくれる
- white-space

[todo]
- column-enforce-mode :: 長い行を知らせてくれる

### lang
- ruby

[todo]
- python
- shel-script
- shell-script

フレームワーク
- ruby-on-rails

#### フロント
- html, haml, slim, pug
- js, typescript

フレームワーク
- vue.js

#### misc
- yaml
- git
- json
- docker

[todo]
- markdown
- org
- xml (まだ入れてない)
- csv
- sql



### キーバインド
- 画面の最大化(maximize-window) / 画面構成を戻す(winner-undo)

## Tips
### 検索
### magit
### 矩形編集
### 文字を大きくする
C-x C-0 => + or - or 0
