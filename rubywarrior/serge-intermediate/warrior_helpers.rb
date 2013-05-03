module Helpers
  def dir
    :forward
  end

  def prev_health
    @prev_health ||= health
  end

  def enemy_direction
    thing_direction :enemy?
  end

  def captive_direction
    thing_direction :captive?
  end

  def bind_direction
    bind_directions.find{ |direction| feel(direction).enemy? }
  end

  def thing_direction(thing_label)
    directions.find{ |direction| feel(direction).method(thing_label).call }
  end

  def enemies_around
    things_around :enemy?
  end

  def captives_around
    things_around :captive?
  end

  def things_around(thing_label)
    directions.map{ |d| feel(d).method(thing_label).call }.reject(&:!).length
  end
end
