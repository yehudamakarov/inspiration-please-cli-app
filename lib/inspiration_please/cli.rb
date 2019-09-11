class InspirationPlease::CLI
  attr_reader :date_page

  def initialize
    @date_page = InspirationPlease::DatePage.new
  end

  def call
    list_date
    menu
  end

  def menu
    puts ''
    input = nil
    begin
        while input != 'exit'
            puts ''
            puts " > Enter '1' for today's day in Jewish History." 
            puts " > Enter '2' for today's Daily Thought." 
            puts " > Or enter 'exit'."
            puts ''
            input = gets.strip
            case input
                when '1'
                    print_jewish_history
                when '2'
                    print_daily_thought
                when 'exit'
                    goodbye
            end
        end
    rescue Interrupt => e
        goodbye
    end
  end

  def list_date
    puts justify_text(" Today is:  ", "≡")
    puts ''
    puts justify_text(date_page.todays_date, ' ')
    puts justify_text(date_page.date_hebrew, ' ')
    puts justify_text(date_page.date_english, ' ')
    puts ''
    puts justify_text('There is something special about today.', '≡')
    puts ''
  end

  def print_jewish_history
    if date_page.jewish_history?
      date_page.history.each do |header, content|
        puts ""
        puts justify_text(date_page.date_hebrew, '-')
        puts ""
        puts justify_text(header.strip, '-')
        puts ""
        puts content.strip
        puts ""
      end
    else
      puts ''
      puts 'Today in Jewish History is a canvas waiting to be painted by you. Try the daily thought. :) '
      puts ''
    end
  end

  def print_daily_thought
    if date_page.daily_thought?
      date_page.daily_thought.each do |header, content|
        puts ''
        puts justify_text(date_page.date_hebrew, '-')
        puts ''
        puts justify_text(header.strip, '-')
        puts ''
        puts content.strip
        puts ''
      end
    else
      puts ''
      puts 'Maybe you have a daily thought? :) '
      puts ''
    end
  end

  def goodbye
    puts "\n"
    puts justify_text('', '.')
    puts justify_text('Make it a day full of good things.', '.')
    puts justify_text(' ♥ ', '.')
  end

  def justify_text(str, char)
    str.center(50, char)
  end
end
