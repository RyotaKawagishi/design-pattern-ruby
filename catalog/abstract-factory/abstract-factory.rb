# 動物と植物にそれぞれ複数の種類がある。
# ここでは池に置く生き物の組み合わせとして、「カエルと藻の系列」と「アヒルとスイレンの系列」を扱う。
# 目的は次の2つ。
# - 生き物を作る Factory の共通インタフェースを定義すること
# - 動物と植物の AbstractProduct を用意し、系列ごとの ConcreteProduct をまとめて生成できるようにすること

# AbstractProduct: 動物
class Animal
  def initialize(name)
    @name = name
  end

  def eat
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end
end

# AbstractProduct: 植物
class Plant
  def initialize(name)
    @name = name
  end

  def grow
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end
end

# ConcreteProduct: 動物/アヒル
class Duck < Animal
  # 食べる(eat)
  def eat
    puts "アヒル #{@name} は食事中です"
  end
end

# ConcreteProduct: 動物/カエル
class Frog < Animal
  # 食べる(eat)
  def eat
    puts "カエル #{@name} は食事中です"
  end
end

# ConcreteProduct: 植物/藻
class Algae < Plant
  def grow
    puts "藻 #{@name} は成長中です"
  end
end

# ConcreteProduct: 植物/スイレン
class WaterLily < Plant
  def grow
    puts "スイレン #{@name} は成長中です"
  end
end

# 池の生態系を作る (Abstract Factory)
class OrganismFactory
  def create_animal(_name)
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end

  def create_plant(_name)
    raise NotImplementedError, "#{self.class} must implement #{__method__}"
  end
end

# カエル(Frog)と藻(Algae)の生成を行う (Concrete Factory)
class PondSetFactory < OrganismFactory
  def create_animal(name)
    Frog.new(name)
  end

  def create_plant(name)
    Algae.new(name)
  end
end

# アヒル(Duck)とスイレン(WaterLily)の生成を行う(Concrete Factory)
class WetlandFactory < OrganismFactory
  def create_animal(name)
    Duck.new(name)
  end

  def create_plant(name)
    WaterLily.new(name)
  end
end

# --- クライアントコード ---
factory = PondSetFactory.new

animal = factory.create_animal("ぴょんた") # この Factory を使うと、animal はカエルが生成される
animal.eat
#=> カエル ぴょんた は食事中です

plant = factory.create_plant("みどり")
plant.grow
#=> 藻 みどり は成長中です
