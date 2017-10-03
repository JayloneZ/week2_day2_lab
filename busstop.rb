class BusStop

attr_accessor :name, :queue
def initialize(name)
  @name = name
  @queue = []
end

def number_of_passengers()
  self.queue.count
end

def add_person_to_queue(passenger)
  self.queue.push(passenger)
end

end
