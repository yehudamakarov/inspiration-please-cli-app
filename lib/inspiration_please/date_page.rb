class InspirationPlease::DatePage

  attr_accessor :doc, :date

  def initialize
    # time = Time.new
    # @date = time.strftime("%m/%d/%Y")
    # @date[0] = '' if @date[0] == '0'
    # date is now the end of the url for today's date_page

    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=10/4/2017"))
  end

  def daily_thought
    puts "THIS IS GOING TO BE THE DAILY THOUGHT. css selector for the daily_thought will puts the daily_thought"
  end

  def jewish_history
    doc.css("div#jewish_history.main div.link.header").each_with_index do |e, i|
      puts "-------------#{e.text}-------------"
      a = doc.css("#JewishHistoryBody#{i} > p")
      a.pop if a[-1].text.start_with?("Links")
      puts "#{a.text}"
      puts ""
    end
  end
end
