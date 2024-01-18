class EventsReport
  CUTOFF_EVENT = "PURCHASE"

  def initialize(events)
    puts events.inspect
    @events = events
  end

  def generate
    journeys = {}
    journey_id = 0
    @events.each do |e|
      journeys[journey_id.to_s] ||= []
      journeys[journey_id.to_s] << e if e.downcase.in?(["purchase", "add_to_cart", "view_product"])
      if e == CUTOFF_EVENT && successfull?(journeys[journey_id.to_s])
        journey_id =+ 1
      end
    end
    journeys
  end

  def successfull?(journeys)
    (journeys & ["purchase", "add_to_cart", "view_product"].map(&:upcase)).size == 3
  end

end