# 基本情報
カタログ: https://refactoring.guru/ja/design-patterns/factory-method
カタログ(Ruby): https://refactoring.guru/ja/design-patterns/factory-method/ruby/example

# カタログ
ここにはカタログ、参考文献を読んでこのデザインパターンについての説明を書く。
実装については同階層の Ruby ファイルに詳しく書く。

## 問題点
オブジェクト生成を呼び出し側で `new` してしまうと、具体クラスへの依存が強くなる。
その結果、次のような問題が起きる。

- 条件分岐が増えて生成ロジックが散らばる
- 具体クラス変更時に呼び出し側を広く修正する必要がある
- テスト時に差し替えしづらい

## 解決
生成処理を Factory Method（ファクトリーメソッド）として Creator 側に閉じ込める。
呼び出し側は Product のインターフェースにだけ依存し、具体クラスの選択は Creator に任せる。
使う側は具体的に何を作るのか・どう作るか知らなくて良くなる

- 依存関係を「抽象（Product）」中心にできる
- 新しい ConcreteProduct を追加しやすい
- 呼び出し側の変更を最小化できる

## コード例

### 通常の方法
```ruby
class User
  def initialize(name)
    @name = name
  end
end

user = User.new("Alice")
```

### ファクトリーパターン
```ruby
class UserFactory
  def self.create(name)
    User.new(name)
  end
end

user = UserFactory.create("Alice")
```

## メリット・デメリット
### メリット
- 生成処理を Creator 側に集約でき、呼び出し側の責務を減らせる
- 具体クラス（`Saxophone` / `Trumpet` など）への直接依存を弱められる
- 新しい Product を追加するときに、既存の利用側コード変更を最小化できる
- テスト時に Factory を差し替えやすく、検証しやすい

### デメリット
- クラス数（Creator / ConcreteCreator / Product）が増えて構成が複雑になる
- 小規模で生成パターンが固定のケースでは、実装コストが過剰になる
- どの ConcreteCreator を使うかの決定箇所を別途設計しないと、利用側に分岐が残る
- パターン理解前は、継承と責務分割の把握に学習コストがかかる

# メモ
- 「何を作るか」の意図は利用側に残ってよいが、「具体クラス名と生成手順」は隠蔽するのがポイント。
- `Creator` は生成メソッドの約束を定義し、実装は `ConcreteCreator` に任せる。
- 親クラスの `initialize` 内で呼んだメソッドでも、`self` は実体インスタンスなのでサブクラス実装が使われる。
- Ruby ではレシーバ省略のメソッド呼び出しは実質 `self.method_name`（ただしセッター代入は `self.` が必要）。
- 小さい実装では過剰設計になりうるので、「生成対象の増加予定」があるかで採用判断する。
