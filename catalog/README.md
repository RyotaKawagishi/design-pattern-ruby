# ディレクトリ構成
catalog
├── README.md
└── {pattern}
    ├── {pattern}.md
    ├── {pattern}.rb
    └── quiz.md

{pattern} はデザインパターンの名称が入り、パターンごとにディレクトリを分ける。
各パターンで説明・実装・まとめ学習をセットで管理する。

## pattern.md
デザインパターンについての説明を書く Markdown ファイル

## pattern.rb
デザインパターンを Ruby で実装したスクリプトファイル
スクリプトは複数ファイルになっても良い(例: pattern.rb, main.rb)

## quiz.md
`pattern.md` と `pattern.rb` を作成した後のまとめ学習用ファイル。
AI に作ってもらった一問一答を 10 問程度記載し、自分の回答を残す。
