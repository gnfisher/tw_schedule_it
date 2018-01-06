require 'forwardable'

module TwScheduleIt
  class Talks
    extend Forwardable
    include Enumerable

    def_delegators :@talks, :each, :size

    def initialize(talks)
      @talks = talks
    end
  end
end
