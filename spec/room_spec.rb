require "./lib/room"
require "rspec"

describe Room do
  describe "Iteration 1" do
    it "exists" do
      room = Room.new(:bedroom, 10, "13")
      expect(room).to be_a Room
    end

    it "it has a category" do
      room = Room.new(:bedroom, 10, "13")

      expect(room.category).to eq(:bedroom)
    end
    
    it "it has a length" do
      room = Room.new(:bedroom, 10, "13")

      expect(room.category).to eq(10)
    end
    
    it "it has a width" do
      room = Room.new(:bedroom, 10, "13")

      expect(room.category).to eq("13")
    end

    it "can get area" do
      room1 = Room.new(:bedroom, 10, "13")
      room2 = Room.new(:living_room, 15, "12")

      expect(room1.area).to eq(130)
      expect(room2.area).to eq(180)
    end

    it "starts unpainted" do
      room = Room.new(:bedroom, 10, "13")

      expect(room.is_painted?).to be false
    end

    it "can paint the room" do
      room = Room.new(:bedroom, 10, "13")
      room.paint

      expect(room.is_painted?).to be true
    end
  end
end
