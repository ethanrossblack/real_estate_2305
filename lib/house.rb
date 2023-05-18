class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price[1..].to_i
  end

  def add_room(room)
    @rooms << room if room.is_a?(Room)
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    Hash[
      "price", price,
      "address", @address
    ]
  end

  def price_per_square_foot
    return 0 if area == 0

    (price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      -room.area
    end
  end

  def rooms_by_category
    rooms_by_category = {}

    @rooms.each do |room|
      if rooms_by_category[room.category]
        rooms_by_category[room.category] << room
      else
        rooms_by_category[room.category] = []
        rooms_by_category[room.category] << room
      end
    end

    rooms_by_category
  end
end