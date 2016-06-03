class Thing
end

class Food < Thing
  attr_reader :taste, :texture

  def initialize(taste = nil, texture = nil)
    @taste   = taste
    @texture = texture
  end

  def appetizer?
    taste == 'salty' && texture == 'crunchy'
  end
  def dessert?
    taste == 'sweet' && texture == 'mushy'
  end
end

class ProcessThings
  def initialize(thing, other_thing)
    @thing       = thing
    @other_thing = other_thing
  end

  def determine_meal
    return default_response unless both_things_are_food?
    return 'Looks like you have an appetizer and dessert' if appetizer_and_dessert?
    return 'Looks like you just have an appetizer' if appetizer?
    return 'Looks like you just have dessert' if dessert?

    default_response
  end

  private

  attr_reader :thing, :other_thing

  def both_things_are_food?
    (thing.class == Food) && (other_thing.class == Food)
  end

  def appetizer_and_dessert?
    thing.appetizer? && other_thing.dessert? || other_thing.appetizer? && thing.dessert?
  end

  def appetizer?
    thing.appetizer? || other_thing.appetizer?
  end

  def dessert?
    thing.dessert? || other_thing.dessert?
  end

  def default_response
    'I cannot determine what you have'
  end
end
