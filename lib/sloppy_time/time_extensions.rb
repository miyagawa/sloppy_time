class Time
  class << self
    def now_with_warning
      SloppyTime::Scanner.check(caller)
      now_without_warning
    end
    alias_method :now_without_warning, :now
    alias_method :now, :now_with_warning
  end
end

class Date
  class << self
    def today_with_warning
      SloppyTime::Scanner.check(caller)
      today_without_warning
    end
    alias_method :today_without_warning, :today
    alias_method :today, :today_with_warning
  end
end

class DateTime
  class << self
    def now_with_warning
      SloppyTime::Scanner.check(caller)
      now_without_warning
    end
    alias_method :now_without_warning, :now
    alias_method :now, :now_with_warning
  end
end
