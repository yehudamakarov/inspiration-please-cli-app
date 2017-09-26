class InspirationPlease::CLI

  attr_accessor :date_page

  def initialize
    @date_page = InspirationPlease::DatePage.new
  end

  def call
    puts "This is the CLI"
    list_date_options
    menu
  end

  def list_date_options
    # if there is jewish_history and if not...
    puts "Today there is Jewish History and a Daily Thought"
    puts ""
  end

  def menu
    puts "There is something special about today. "
    puts ""
    input = nil
    while input != 'exit'
      puts "Press 1 for more info on today's day in Jewish History. Press 2 for more info on today's daily thought. Or press exit."
      puts ""
      input = gets.strip
      case input
      when "1"
        self.date_page.jewish_history
      when "2"
        self.date_page.daily_thought
      when "exit"
        goodbye
      end
    end
  end

  def goodbye
    puts "Make it a day full of good things."
  end
end
