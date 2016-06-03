class Thing
end

class Food < Thing
  def initialize(taste = nil, texture = nil)
    @taste   = taste
    @texture = texture
  end

  def taste
    @taste
  end

  def texture
    @texture
  end
end

class ProcessThings
  def initialize(thing, other_thing)
    @thing       = thing
    @other_thing = other_thing
  end

  def determine_meal
    if (@thing.class == Food) && (@other_thing.class == Food) && (((@thing.taste == 'salty' && @thing.texture == 'crunchy') && (@other_thing.taste == 'sweet' && @other_thing.texture == 'mushy')) || ((@other_thing.taste == 'salty' && @other_thing.texture == 'crunchy') && (@thing.taste == 'sweet' && @thing.texture == 'mushy')))
      'Looks like you have an appetizer and dessert'
    elsif (@thing.class == Food) && (@other_thing.class == Food) && ((@thing.taste == 'salty' && @thing.texture == 'crunchy') || (@other_thing.taste == 'salty' && @other_thing.texture == 'crunchy'))
      'Looks like you just have an appetizer'
    elsif (@thing.class == Food) && (@other_thing.class == Food) && ((@thing.taste == 'sweet' && @thing.texture == 'mushy') || (@other_thing.taste == 'sweet' && @other_thing.texture == 'mushy'))
      'Looks like you just have dessert'
    else
      'I cannot determine what you have'
    end
  end
end
