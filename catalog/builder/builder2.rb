# builder.rb との違い:
# builder.rb は Product と Builder の役割が少し混ざっていたが、
# builder2.rb は Builder / ConcreteBuilder / Product / Director を分けている。
# ConcreteBuilder が内部で Product を組み立て、最後に product メソッドで返す。
# また、内部状態の変更処理も Builder ではなく Product 側に寄せている。
# こちらは builder を使い捨てにし、product 取得時に reset しない形にしている。

# Builder: 組み立て手順のインタフェースを定義する
class Builder
  def add_water(_amount)
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end

  def add_material(_amount)
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end
end

# Product: 砂糖水
class SugarWater
  attr_reader :water, :sugar

  def initialize
    @water = 0
    @sugar = 0
  end

  def add_water(amount)
    @water += amount
  end

  def add_material(amount)
    @sugar += amount
  end

  def description
    "SugarWater(water=#{water}, sugar=#{sugar})"
  end
end

# Product: 塩水
class SaltWater
  attr_reader :water, :salt

  def initialize
    @water = 0
    @salt = 0
  end

  def add_water(amount)
    @water += amount
  end

  def add_material(amount)
    @salt += amount
  end

  def description
    "SaltWater(water=#{water}, salt=#{salt})"
  end
end

# ConcreteBuilder: SugarWater を組み立てる
class SugarWaterBuilder < Builder
  def initialize
    @product = SugarWater.new
  end

  def add_water(amount)
    @product.add_water(amount)
  end

  def add_material(amount)
    @product.add_material(amount)
  end

  def product
    @product
  end
end

# ConcreteBuilder: SaltWater を組み立てる
class SaltWaterBuilder < Builder
  def initialize
    @product = SaltWater.new
  end

  def add_water(amount)
    @product.add_water(amount)
  end

  def add_material(amount)
    @product.add_material(amount)
  end

  def product
    @product
  end
end

# Director: Builder の操作だけを使って組み立て手順を定義する
class Director
  attr_writer :builder

  def initialize(builder = nil)
    @builder = builder
  end

  def cook
    @builder.add_water(150)
    @builder.add_material(90)
    @builder.add_water(300)
    @builder.add_material(35)
  end
end

director = Director.new

sugar_builder = SugarWaterBuilder.new
director.builder = sugar_builder
director.cook
puts sugar_builder.product.description

salt_builder = SaltWaterBuilder.new
director.builder = salt_builder
director.cook
puts salt_builder.product.description
