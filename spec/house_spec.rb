require "./lib/room"
require "./lib/house"
require "rspec"

describe House do
  describe Iteration 2 do
    before(:each) do
      @house = House.new("$400000", "123 sugar lane")
      @room1 = Room.new(:bedroom, 10, "13")
      @room1 = Room.new(:bedroom, 11, "15")
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
      house.add_room(@room1)
      house.add_room(@room2)

      expect(@house.rooms).to include(@room1, @room2)
    end
  end
end