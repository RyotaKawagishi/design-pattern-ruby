# 生成は Product ではなく Creator, Concrete Creator で行う
# Product は生成されるオブジェクトのインターフェースのみを定義する
# Creator は可能な限り抽象化する
# - Creator は生成を宣言するのみで、生成の実装は Concrete Creator に任せる
# - Creator は Concrete Creator を知る必要はない(楽器が増えても Creator は変更不要)

# サックス（Product）
class Saxophone
  def initialize(name)
    @name = name
  end

  def play
    puts "#{@name}は音を奏でています。"
  end
end

# トランペット（Product）
class Trumpet
  def initialize(name)
    @name = name
  end

  def play
    puts "#{@name}は明るい音を奏でています。"
  end
end

# 楽器工場（Creator）
class InstrumentFactory
  def initialize(number_instruments)
    @instruments = []
    number_instruments.times do |i|
      instrument = new_instrument("楽器#{i + 1}")
      @instruments << instrument
    end
  end

  def ship_out
    tmp = @instruments.dup
    @instruments = []
    tmp
  end

  def new_instrument(_name)
    raise NotImplementedError, "subclass must implement new_instrument"
  end
end

# サックスを生成する工場（Concrete Creator）
class SaxophoneFactory < InstrumentFactory
  def new_instrument(name)
    Saxophone.new(name)
  end
end

# トランペットを生成する工場（Concrete Creator）
class TrumpetFactory < InstrumentFactory
  def new_instrument(name)
    Trumpet.new(name)
  end
end

# ファクトリーがないと、楽器の生成は呼び出す側が行う必要がある
# saxophones = []
# 3.times do |i|
#   saxophones << Saxophone.new("サックス#{i + 1}")
# end
# saxophones.each(&:play)

# ファクトリーを使うと、楽器の生成は工場が行うため、呼び出す側は生成の詳細を知らなくて済む
# 呼び出す側は Creator を通して Product を生成する
factory = SaxophoneFactory.new(3)
instruments = factory.ship_out
instruments.each(&:play)