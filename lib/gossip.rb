require 'bundler'
Bundler.require

class Gossip
  attr_accessor :author, :content
  
  def initialize(arg1, arg2)
    @author = arg1
    @content = arg2
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    return Gossip.all[id.to_i]
  end
end