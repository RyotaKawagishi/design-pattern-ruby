# quiz

`factory-method.md` と `factory-method.rb` の理解確認用の一問一答です。

## Q1
Factory Method パターンの目的は何ですか？

### 自分の回答
呼び出し側から生成の詳細を隠蔽すること、生成するものが増えても工場の抽象クラスを変更しなくて良いこと

### 解説
その理解で合っています。利用側は「具体的に何をどう `new` するか」を知らず、Creator の約束だけを使います。結果として変更に強くなります。

## Q2
オブジェクト生成を呼び出し側で直接 `new` する問題は何ですか？

### 自分の回答
呼び出し側がどのように作るか知っている、つまり作り方を変えたら呼び出し側も変えないといけない

### 解説
正しいです。利用側が具体クラスに依存するため、生成対象変更時に修正範囲が広がります。条件分岐の増加やテスト差し替えの難しさも起きます。

## Q3
Creator の責務は何ですか？

### 自分の回答
生成する（具象クラスに生成するメソッドがあること）ことを宣言する。

### 解説
正しいです。Creator は Factory Method の「約束」を定義します。実際の生成処理は ConcreteCreator が実装します。

## Q4
Product の責務は何ですか？

### 自分の回答
生成以外のインターフェースを実装する

### 解説
良い理解です。Product は利用側が使う共通操作（例: `play`）を提供します。生成責務は Product ではなく Creator 側に置きます。

## Q5
ConcreteProduct を追加するとき、どこに変更を加えるべきですか？

### 自分の回答
ConcrateFacory

### 解説
ほぼ正解です。通常は「ConcreteProduct の追加」と、それを返す「ConcreteCreator（Factory）」の追加で対応します。既存 Creator や利用側の変更は最小化します。

## Q6
このパターンが OCP にどう貢献しますか？

### 自分の回答
わからん

### 解説
OCP（開放/閉鎖原則）は「拡張には開き、修正には閉じる」です。Factory Method では新しい Product/Factory を追加して拡張でき、既存利用側の修正を減らせます。

## Q7
Factory Method と Abstract Factory の違いを1つ説明してください。

### 自分の回答
わからん

### 解説
Factory Method は「1つの生成メソッドをサブクラスで差し替える」中心のパターンです。Abstract Factory は「関連する複数製品の生成群」をまとめて切り替えます。

## Q8
Factory Method を適用しない方がよい場面はありますか？

### 自分の回答
生成するものの種類が増えないことがわかっている場合

### 解説
正しいです。生成対象が固定で単純な場合は、クラス分割コストがメリットを上回ることがあります。

## Q9
今回の実装で、クライアントが依存すべき型は何ですか？

### 自分の回答
わからん

### 解説
基本は Product の抽象（共通インターフェース）です。加えて生成入口としては Creator の約束に依存します。具体クラス名への直接依存は避けるのが狙いです。

## Q10
このパターンを使って得られるテスト上のメリットは何ですか？

### 自分の回答
モックを作成しやすい（よくわかってない）

### 解説
その方向で正しいです。Factory を差し替えてテスト用 Product を返せるため、外部依存を減らした単体テストを書きやすくなります。

```ruby
# 1) Factory Method なし（呼び出し側が直接生成）
class Saxophone
  def play
    "real"
  end
end

def play_all_without_factory
  [Saxophone.new, Saxophone.new].map(&:play)
end

# 2) Factory Method あり（Factory を差し替え可能）
class DummyInstrument
  def play
    "dummy"
  end
end

class DummyFactory < InstrumentFactory
  def new_instrument(_name)
    DummyInstrument.new
  end
end

def play_all_with_factory(factory)
  factory.ship_out.map(&:play)
end

without = play_all_without_factory
# => ["real", "real"]  # 実体に固定されやすい

with = play_all_with_factory(DummyFactory.new(2))
# => ["dummy", "dummy"] # テスト用実装に差し替えやすい
```
