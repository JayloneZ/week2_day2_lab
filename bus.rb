class Bus

  attr_accessor :route_number, :destination, :passengers
  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    "Brum brum"
  end

  def number_of_passengers()
    self.passengers.count
  end

  def pick_up(passenger)
    self.passengers.push(passenger)
  end

  def drop_off(passenger)
    self.passengers.delete(passenger)
  end

  def empty()
    self.passengers.clear()
  end

  def add_queue_to_bus(busstop)
    self.passengers.concat(busstop.queue)
    busstop.queue.clear()
    return self.passengers
  end

end
