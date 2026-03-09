# 基本情報
カタログ: https://refactoring.guru/ja/design-patterns/abstract-factory
カタログ(Ruby): https://refactoring.guru/ja/design-patterns/abstract-factory/ruby/example

# カタログ
ここにはカタログ、参考文献を読んでこのデザインパターンについての説明を書く。
実装については同階層の Ruby ファイルに詳しく書く。

## 問題点
関連するオブジェクトを複数まとめて使いたいとき、クライアントが具体クラスを直接生成していると、
組み合わせの整合性を保つのが難しくなる。

- 同じ系列の製品をそろえたいのに、別系列のクラスを混ぜてしまいやすい
- 生成する具体クラスの知識がクライアント側に広がる
- 製品群の切り替え（例: テーマ A / テーマ B）が発生すると、生成箇所を広く修正する必要がある

## 解決
関連する製品群をまとめて生成するための Factory の抽象を用意し、
クライアントはその抽象インタフェースだけに依存するようにする。

ConcreteFactory は同じ系列に属する Product 群をまとめて返し、
クライアントは Factory を差し替えるだけで整合した製品セットを切り替えられる。

- クライアントは具体クラス名を直接知らなくてよい
  - `PondSetFactory` を使うクライアントは `Frog.new` や `Algae.new` を直接書かず、`create_animal` と `create_plant` を呼ぶだけでよい
- 同じ系列の Product をまとめて生成できる
  - `PondSetFactory` は `Frog` と `Algae` を、`WetlandFactory` は `Duck` と `WaterLily` を返し、整合した組み合わせをまとめて作れる
- 製品群の切り替えを Factory の差し替えで表現できる
  - クライアントコードの流れを変えずに、使う Factory を `PondSetFactory` から `WetlandFactory` に変えるだけで、生成物全体を切り替えられる

### 構成要素
- AbstractFactory: クライアントから呼ばれる生成用インターフェース
- ConcreteFactory: 系列ごとにどんな製品を作るか知っている、系列の ConcreteProduct 群を**まとめて**生成する
- AbstractProduct: クライアントから呼ばれる製品操作インターフェース(系列によらず共通)
- ConcreteProduct: 系列ごとの製品の詳細を知っている

## コード例
Abstract Factory を使わない場合、クライアントが具体クラスを直接選んで生成することになる。

```ruby
button = WindowsButton.new
checkbox = MacCheckbox.new
```

この形だと、同じ系列の製品でそろえる保証がなく、`WindowsButton` と `MacCheckbox` のような不整合な組み合わせが起きやすい。

Abstract Factory を導入すると、クライアントは Factory だけを差し替えて関連する製品群をまとめて受け取れる。

```ruby
factory = WindowsFactory.new
button = factory.create_button
checkbox = factory.create_checkbox

puts button.paint
puts checkbox.paint
```

この形だと、`WindowsFactory` を `MacFactory` に差し替えるだけで、
ボタンとチェックボックスを同じ系列の製品にまとめて切り替えられる。

- パターンなし：クライアントが具体クラスを直接選び、組み合わせの整合性も自分で管理する
- パターンあり：クライアントは Factory の抽象に依存し、整合した製品群をまとめて受け取る
- Factory を差し替えるだけで、製品セット全体を一貫して切り替えられる

## メリット・デメリット
### デメリット
- 種類が増えるとつらい。たとえば Plant に加えて Rock も必要になったら、
  - AbstractFactory に create_rock を追加
  - すべての ConcreteFactory に create_rock を追加

# メモ
ここには自分で考えたこと、わからないことを書き留めておく。

- ConcreteFactoryを入れ替えることで系列ごとに**まとめて**作成できる。
- AbstractはConcreteのインターフェースの実装漏れを防ぐだけの意味しかないように見える
  - 確かにそう。同名メソッドを忘れず書けばいいだけだが、共通インターフェースがあるとコード上に約束する意味が大きい
  - コード例のように変数名を種類名と合わせられる（系列はいらない）、というのを考えると理解できる
  - パターンを使っていないと クライアントが Win, Mac という具体クラス名を知らないといけない
- 系列の追加は拡張しやすい、種類を増やすのはつらい
  - ありそうな種類×系列の例
  - 種類(税金計算, 保険料計算) × 系列(日本, アメリカ, ...)
    - 種類はそうそう増えなそうだが、系列はスケールしたくなりそう
    - 系列ごとに計算機インターフェースの中身をちょっとずつ変えたい
    - 系列を増やしても同じ種類の計算機インターフェースが必ず必要。まとめて作りたい