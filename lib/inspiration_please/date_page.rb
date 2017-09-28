class InspirationPlease::DatePage

# should also build in "curious about a specific date?" enter and pull that down.

  attr_accessor :doc, :date, :history, :daily_thought
  def initialize
    # time = Time.new
    # @date = time.strftime("%m/%d/%Y")
    # @date[3] = '' if @date[3] == '0'
    # @date[0] = '' if @date[0] == '0'
    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=9/4/2017"))
    @history = {}
    jewish_history_hash
    @daily_thought = {}
    daily_thought
  end

  def jewish_history_hash
    doc.css("div#jewish_history.main div.link.header").each_with_index do |e, i|
      @history["#{e.text}"] = "#{(doc.css("#JewishHistoryBody#{i} > p").map{|d| "" << "#{d.text}" unless d.text.include?("Link")}.take 1).join}"
    end
  end

  def daily_thought
    text = ""
    doc.css("#DailyThoughtBody0 p").each{|e| text << "#{e.text} "}
    text << "#{doc.css("#footnotetable > div").text} "
    @daily_thought[doc.css("div.link.header.blue").text.delete! "\n" "\t"] = text
  end

  def jewish_history?
    !history.empty?
  end

  def daily_thought?
    !daily_thought.empty?
  end

end
