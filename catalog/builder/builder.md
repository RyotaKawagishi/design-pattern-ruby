# 基本情報
カタログ: https://refactoring.guru/ja/design-patterns/builder
カタログ(Ruby): https://refactoring.guru/ja/design-patterns/builder/ruby/example

# カタログ
ここにはカタログ、参考文献を読んでこのデザインパターンについての説明を書く。
実装については同階層の Ruby ファイルに詳しく書く。

## 問題点
同じ種類のオブジェクトでも、組み立て手順やオプションの組み合わせが複雑になると、
コンストラクタ引数が増えたり、生成ロジック/バリデーションが呼び出し側に散らばって可読性が下がる。

- 長い引数列になり、どの値が何を意味するか分かりづらい
- 生成手順の違い（簡易版/詳細版など）を再利用しにくい
- 必須項目と任意項目の管理が難しく、生成ミスが起きやすい

## 解決
Builder を導入し、「何を組み立てるか」と「どう組み立てるか」を分離する。
Builder は部品ごとの設定手順を提供し、必要なら Director が手順の順番を定義する。

### 構成要素
- Director：Builder で提供されているインタフェースのみを使って、組み立て手順を進める
- Builder：組み立てに必要な各メソッドのインタフェースを定める
- ConcreteBuilder：Builder が定めたインタフェースを実装する

- 呼び出し側は段階的に分かりやすく設定できる
- 同じ手順で異なる表現（別 Product）を作れる
- 複雑な生成ロジックを Builder 側に閉じ込めて再利用できる

## コード例
このディレクトリには、役割を簡略化した `builder.rb` と、Refactoring.Guru の整理に近い `builder2.rb` の 2 つの実装を置いている。

Builder パターンを使わない場合、クライアント側が生成手順をそのまま持つことになる。

```ruby
sugar_water = SugarWater.new(0, 0)
sugar_water.water += 150
sugar_water.add_material(90)
sugar_water.water += 300
sugar_water.add_material(35)

p sugar_water
#=> #<SugarWater ... @water=450, @sugar=125>
```

この形だと、クライアントが「どの順番で」「何をどれだけ入れるか」まで知っている必要がある。

Builder パターンを導入すると、クライアントは Builder と Director に処理を任せられる。

```ruby
builder = WaterWithMaterialBuilder.new(SugarWater)
director = Director.new(builder)
director.cook

p builder.result
#=> #<SugarWater ... @water=450, @sugar=125>
```

この形だと、クライアントは「何を作りたいか」を渡すだけでよく、
具体的な組み立て手順は `Director` と `Builder` 側に閉じ込められる。

- パターンなし：クライアントが生成手順を直接持つ
- パターンあり：クライアントは組み立てを依頼し、手順は Builder/Director に集約される
- Builder を差し替えることで、同じ手順を別の生成物にも使い回せる

## メリット・デメリット
### メリット
- 複雑な生成手順を段階的に書けるため、処理の流れを追いやすい
- 同じ手順で異なる生成物を作れるため、組み立て手順を再利用しやすい
- 生成ロジックを Builder や Director に寄せることで、呼び出し側を簡潔にできる

### デメリット
- 単純な生成処理にはクラス数が増え、設計が大きくなりやすい
- Builder、Director、Product の責務を整理しないと、役割が曖昧になりやすい
- 実装によっては Builder が Product の内部構造に依存し、結合が強くなる

# メモ
Builder だけだと、複雑さの置き場所がクライアントから Builder に移るだけで、生成物の種類が増えたときに Builder が肥大化しやすい。
ConcreteBuilder に分ければ、生成物ごとの差分を個別に閉じ込めつつ、既存 Builder の条件分岐を増やさないでよい。
Abstract でインタフェースの存在を宣言し、小さな Concrete でそれを実装する構成は、今後のパターンでも繰り返し出てきそう。
パターンの目的を再利用性だけで考えがちだが、単に処理をメソッドへ移譲すれば足りる場合もある。なぜメソッド分割ではなくクラス追加が必要なのか、責務分離や差し替え可能性の観点でも考える必要がある。
