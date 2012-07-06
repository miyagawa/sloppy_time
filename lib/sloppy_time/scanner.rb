module SloppyTime
  class Scanner
    class_attribute :scanned
    def self.check(caller)
      self.scanned ||= {}
      caller.each do |c|
        file, line, where = c.split ':'
        if %r[/app/models/].match file
          unless self.scanned.has_key?(c)
            self.scanned[c] = scan(file, line.to_i)
          end
          break
        end
      end
    end

    def self.scan(filename, num)
      file = File.open(filename)
      line = [*file][num - 1]
      if /\b(named_)?scope\b/.match line
        warn "WARNING: Your model has a scope with Time evaluated immediately. You might have to use lambda instead.\n" +
          "#{filename}:#{num}: #{line}\n"
        true
      else
        false
      end
    end
  end
end
