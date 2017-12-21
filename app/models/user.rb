class User < ActiveRecord::Base

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end

  def message(id)
    attraction = Attraction.find(id)
    if self.height >= attraction.min_height && self.tickets >= attraction.tickets
      self.update_tickets(attraction)
      self.update_mood(attraction)
    end
  end

  def message_text(id)
    attraction = Attraction.find(id)
    if self.height >= attraction.min_height && self.tickets >= attraction.tickets
      return "Thanks for riding the #{attraction.name}!"
    elsif self.height < attraction.min_height && self.tickets >= attraction.tickets
      return "You are not tall enough to ride the #{attraction.name}"
    elsif self.height >= attraction.min_height && self.tickets < attraction.tickets
      return "You do not have enough tickets to ride the #{attraction.name}"
    else
      return "You are not tall enough to ride the #{attraction.name}" + ", " + "You do not have enough tickets to ride the #{attraction.name}"
    end
  end

  def update_tickets(instance)
    self.tickets -= instance.tickets
    self.save
    nil
  end

  def update_mood(instance)
    self.happiness += instance.happiness_rating
    self.nausea += instance.nausea_rating
    self.save
    nil
  end

end
