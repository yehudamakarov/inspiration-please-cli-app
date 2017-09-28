class InspirationPlease::CLI
  attr_accessor :date_page

  def initialize
    @date_page = InspirationPlease::DatePage.new
  end

  def call
    list_date_options
    menu
  end

  def menu
    puts ''
    input = nil
    while input != 'exit'
      puts ''
      puts "Enter '1' for today's day in Jewish History. Enter '2' for today's Daily Thought. Or enter 'exit'."
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
  end

  def list_date_options
    puts "----- #{date_page.date} -----"
    puts "---*-- #{date_page.date_hebrew} --*---"
    puts "----- #{date_page.date_english} -----"
    puts ''
    puts 'There is something special about today. '
    puts ''
    puts '=== - ==='
    puts ''
    puts ''
  end

  def print_jewish_history
    if date_page.jewish_history?
      date_page.history.each do |header, content|
        puts ''
        puts "    - #{date_page.date_hebrew} -    "
        puts ''
        puts "-------------#{header}-------------"
        puts ''
        puts content.to_s
        puts ''
        puts '--==--'
      end
    else
      puts ''
      puts 'Today in Jewish History is a canvas waiting to be painted by you. Try the daily thought. :) '
      puts ''
    end
  end

  def date; end

  def print_daily_thought
    if date_page.daily_thought?
      date_page.daily_thought.each do |header, content|
        puts ''
        puts "    - #{date_page.date_hebrew} -    "
        puts ''
        puts "-------------#{header}-------------"
        puts ''
        puts content.to_s
        puts ''
      end
    else
      puts ''
      puts 'Maybe you have a daily thought? :) '
      puts ''
    end
  end

  def goodbye
    puts ''
    puts 'Make it a day full of good things.'
    puts ''
  end
end
