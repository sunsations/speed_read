require "speed_read/version"
require "colorize"

module SpeedRead

  ORP_VISUAL_POS = 20;

  class << self
    trap("INT") { puts "\nGoodbye!"; exit;}

    def start(words_per_minute)
      puts " " * ORP_VISUAL_POS + "v".colorize(:red)
      ARGF.each do |line|
         words = tokenize(line)
         words.each do |word|
           # pad the end of your lines with spaces if they might be shorter than the previous line.
           orp = find_ORP(word);
           output = " " * (ORP_VISUAL_POS-orp) + colorize_word(word,orp)
           print output.ljust(80, " ") + "#{words_per_minute} wpm\r"
           $stdout.flush
           sleep (60.0 / words_per_minute.to_i)
         end
      end
      puts
    end

    def tokenize(input)
       input.chomp.split(/(?:-|\s)+/).compact.reject{|e| e.empty?}
    end

    # ORP: Optical Recognition Point (the red-colored alignment pilot),
    # # the way Spritz probably does it.
    def find_ORP(word)
      return 0 if word.nil?
      return 4 if word.length > 13
      return [0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3][word.size];
    end

    def colorize_word(word, i)
      return "" unless word
      pre    = word[0...i]
      pivot  = word[i] ? word[i].colorize(:red) : ""
      suffix = word[i+1..-1]
      "#{pre}#{pivot}#{suffix}"
    end

  end
end
