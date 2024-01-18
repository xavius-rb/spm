class EventsReport
  CUTOFF_EVENT = "PURCHASE"
  SUCCESSFUL_JOURNEY_REQUIREMENTS = %W(PURCHASE ADD_TO_CART VIEW_PRODUCT)

  attr_reader :events

  def initialize(events)
    @events = events
    @journeys = Hash.new {|h,k| h[k] = [] }
  end

  def generate
    journey_id = 0
    tmp_journey = []
    events.each do |event|
      if event.in?(SUCCESSFUL_JOURNEY_REQUIREMENTS)
        tmp_journey << event
      else
        # successful journey interrupted
        tmp_journey.clear
      end

      if event == CUTOFF_EVENT && successful_journey?(tmp_journey)
        add_journey(journey_id, tmp_journey.dup)
        journey_id =+ 1
        tmp_journey.clear
      end
    end

    @journeys
  end

  def successful_journey?(journey)
    (journey & SUCCESSFUL_JOURNEY_REQUIREMENTS).size == SUCCESSFUL_JOURNEY_REQUIREMENTS.size
  end

  private
  def add_journey(key, journey)
    @journeys[key.to_s] = journey
  end
end