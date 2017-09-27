class InspirationPlease::DatePage

  attr_accessor :doc, :date, :titles, :descriptions, :daily_thought_header, :daily_thought_description

  def initialize
    time = Time.new
    @date = time.strftime("%m/%d/%Y")
    @date[3] = '' if @date[3] == '0'
    @date[0] = '' if @date[0] == '0'
    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=#{@date}"))
    @titles = []
    @descriptions = []
    @daily_thought_header = ""
    @daily_thought_description = ""
  end

  def daily_thought
    self.daily_thought_header = "-------------#{doc.css("div.link.header.blue").text.delete! "\n" "\t"}-------------"
    doc.css("#DailyThoughtBody0 p").each do |e|
      self.daily_thought_description << "#{e.text} "
    end
    self.daily_thought_description << "#{doc.css("#footnotetable > div").text} "
  end

  def jewish_history?
    !doc.css("div#jewish_history.main div.link.header").empty?
  end

  def daily_thought?
    !doc.css("div.link.header.blue").empty?
  end

  def jewish_history
    doc.css("div#jewish_history.main div.link.header").each_with_index do |e, i|
      @titles << "-------------#{e.text}-------------"
      a = doc.css("#JewishHistoryBody#{i} > p")
      a.each do |e|
        break if e.text.include?("Link")
        @descriptions << "#{e.text}"
      end
    end
  end
end
