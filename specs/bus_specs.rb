require("minitest/autorun")
require("minitest/rg")
require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../busstop.rb')

class TestBus < Minitest::Test

  def setup
    @bus = Bus.new(22, "Ocean Terminal")
    @person = Person.new("Hank", 22)
    @busstop = BusStop.new("Ocean Terminal")
  end

  def test_drive()
    result = @bus.drive
    assert_equal("Brum brum", result)
  end

  def test_number_of_passengers()
    result = @bus.number_of_passengers()
    assert_equal(0, result)
  end

  def test_pick_up()
    @bus.pick_up(@person)
    assert_equal(1, @bus.number_of_passengers())
  end

  def test_drop_off()
    @bus.pick_up(@person)
    @bus.drop_off(@person)
    assert_equal(0, @bus.number_of_passengers())
  end

  def test_empty()
    @bus.pick_up(@person)
    @bus.empty()
    assert_equal(0, @bus.number_of_passengers())
  end

  def test_add_person_to_queue()
    result = @busstop.add_person_to_queue(@person)
    assert_equal([@person], result)
  end

  def test_add_queue_to_bus__queue_on_bus()
    @busstop.add_person_to_queue(@person)
    result = @bus.add_queue_to_bus(@busstop)
    assert_equal([@person], result)
  end

  def test_add_queue_to_bus__queue_clear()
    @busstop.add_person_to_queue(@person)
    @bus.add_queue_to_bus(@busstop)
    assert_equal(0, @busstop.number_of_passengers())
  end


end
