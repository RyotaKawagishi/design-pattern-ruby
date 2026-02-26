# ディレクトリ構成
catalog
├── README.md
└── {pattern}
    ├── {pattern}.md
    └── {pattern}.rb

{pattern} はデザインパターンの名称が入り、パターンごとにディレクトリを分ける。
Markdown ファイルと Ruby ファイルがデザインパターンにつき1つ以上ある。

## pattern.md
デザインパターンについての説明を書く Markdown ファイル

## pattern.rb
デザインパターンを Ruby で実装したスクリプトファイル
スクリプトは複数ファイルになっても良い(例: pattern.rb, main.rb)