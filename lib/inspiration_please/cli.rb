class InspirationPlease::CLI

  attr_accessor :date_page

  def initialize
    @date_page = InspirationPlease::DatePage.new
  end

  def call
    list_date_options
    menu
  end

  def list_date_options
    puts "There is something special about today. "
    puts ""
  end

  def menu
    puts ""
    input = nil
    while input != 'exit'
      puts "Press 1 for more info on today's day in Jewish History. Press 2 for more info on today's Daily Thought. Or press exit."
      puts ""
      input = gets.strip
      case input
      when "1"
        print_jewish_history
      when "2"
        print_daily_thought
      when "exit"
        goodbye
      end
    end
  end

  def print_jewish_history
    if date_page.jewish_history?
      date_page.jewish_history
      date_page.titles.each_with_index do |t, i|
        puts "#{t}"
        puts "#{date_page.descriptions[i]}"
        puts ""
      end
    else
      puts ""
      puts "Today in Jewish History is a canvas waiting to be painted by you. Try the daily thought. :) "
      puts ""
    end
  end

  def print_daily_thought
    if date_page.daily_thought?
      date_page.daily_thought
      puts "#{date_page.daily_thought_header}"
      puts "#{date_page.daily_thought_description}"
      puts ""
    else
      puts ""
      puts "Maybe you have a daily thought? :) "
      puts ""
    end
  end

  def goodbye
    puts "Make it a day full of good things."
  end
end
