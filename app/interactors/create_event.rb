class CreateEvent

  def self.call(name, tagline)
    event = Event.create(name: name, tagline: tagline)
    Person.find_each do |p|
      p.starting_weight = p.checkins.first.weight 
      p.up_by = nil

      p.save
    end
    event
  end
end