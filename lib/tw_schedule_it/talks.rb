require 'forwardable'
module TwScheduleIt
  class Talks
    extend Forwardable
    def_delegators :@talks, :each, :size
    include Enumerable

    def initialize(talks)
      @talks = talks
    end
  end
end
