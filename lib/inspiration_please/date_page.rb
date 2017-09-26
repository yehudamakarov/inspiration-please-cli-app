class InspirationPlease::DatePage

  attr_accessor :doc, :date

  def initialize
    time = Time.new
    @date = time.strftime("%m/%d/%Y")
    @date[0] = '' if @date[0] == '0'
    # date is now the end of the url for today's date_page

    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=#{@date}"))
  end

  def daily_thought
    puts "THIS IS GOING TO BE THE DAILY THOUGHT. css selector for the daily_thought will puts the daily_thought"
  end

  def jewish_history
    puts "THIS IS GOING TO BE THE JEWISH HISTORY OF TODAY. css selector for the jewish_history will puts the jewish_history"
  end
end
