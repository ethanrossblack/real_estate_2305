require "./lib/room"
require "./lib/house"
require "rspec"

describe "House" do
  describe "Iteration 2" do
    before(:each) do
      @house = House.new("$400000", "123 sugar lane")
      @room1 = Room.new(:bedroom, 10, "13")
      @room2 = Room.new(:bedroom, 11, "15")
    end

    it "exists" do
      expect(@house).to be_a(House)
    end

    it "has a price" do
      expect(@house.price).to eq(400000)
    end

    it "has an address" do
      expect(@house.address).to eq("123 sugar lane")
    end

    it "initializes without rooms" do
      expect(@house.rooms).to be_an(Array)
      expect(@house.rooms).to be_empty
    end

    it "can add rooms" do
      @house.add_room(@room1)
      @house.add_room(@room2)

      expect(@house.rooms).to include(@room1, @room2)
    end
  end

  describe "Iteration 3" do
    before(:each) do
      @house = House.new("$400000", "123 sugar lane")
      @room1 = Room.new(:bedroom, 10, "13")
      @room2 = Room.new(:bedroom, 11, "15")
      @room3 = Room.new(:living_room, 25, "15")
      @room4 = Room.new(:basement, 30, "41")
    end

    it "can be #above_market_average? with a price greater than $500k" do
      house2 = House.new("$600000", "124 sugar lane")

      expect(house2.above_market_average?).to be true
    end
    
    it "can not be #above_market_average? with a price less or equal to than $500k" do
      house3 = House.new("$500000", "125 sugar lane")

      expect(@house.above_market_average?).to be false
      expect(house3.above_market_average?).to be false
    end

    it "can list #rooms_from_category" do
      @house.add_room(@room1)
      @house.add_room(@room2)
      @house.add_room(@room3)
      @house.add_room(@room4)

      expect(@house.rooms_from_category(:bedroom)).to eq([@room1, @room2])
      expect(@house.rooms_from_category(:bedroom)).to contain_exactly(@room1, @room2)

      expect(@house.rooms_from_category(:living_room)).to eq([@room3])
      expect(@house.rooms_from_category(:living_room)).to contain_exactly(@room3)

      expect(@house.rooms_from_category(:basement)).to eq([@room4])
      expect(@house.rooms_from_category(:basement)).to contain_exactly(@room4)
      
      expect(@house.rooms_from_category(:kitchen)).to eq([])
      expect(@house.rooms_from_category(:kitchen)).to be_empty
    end

    it "can calculate total House #area" do
      expect(@house.area).to eq(0)
      
      @house.add_room(@room1) # @room1.area => 130
      
      expect(@house.area).to eq(130)
      
      @house.add_room(@room2) # @room2.area => 165

      expect(@house.area).to eq(295)
      
      @house.add_room(@room3) # @room3.area => 375
      
      expect(@house.area).to eq(670)

      @house.add_room(@room4) # @room4.area => 1230

      expect(@house.area).to eq(1900)
    end

    it "can return House #details in a Hash" do
      expect(@house.details).to be_a(Hash)
      expect(@house.details["price"]).to eq(400000)
      expect(@house.details["address"]).to eq("123 sugar lane")
    end
  end

  describe "Iteration 4" do
    before(:each) do
      @house = House.new("$400000", "123 sugar lane")
      @room1 = Room.new(:bedroom, 10, "13")
      @room2 = Room.new(:bedroom, 11, "15")
      @room3 = Room.new(:living_room, 25, "15")
      @room4 = Room.new(:basement, 30, "41")

      @house.add_room(@room1)
      @house.add_room(@room2)
      @house.add_room(@room3)
      @house.add_room(@room4)
    end

    it "can calculate #price_per_square_foot" do
      expect(@house.price_per_square_foot).to eq(210.53)
    end

    it "can return #rooms_sorted_by_area" do
      expect(@house.rooms_sorted_by_area).to eq([@room4, @room3, @room2, @room1])
    end

    it "can return a Hash of rooms by category" do
      expect(@house.rooms_by_category).to be_a(Hash)
      expect(@house.rooms_by_category).to eq({bedroom: [@room1, @room2], living_room: [@room3], basement: [@room4]})
    end
  end
end