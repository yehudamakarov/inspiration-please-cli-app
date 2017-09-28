class InspirationPlease::DatePage
  # Must print Hebrew and English date.

  # should also build in "curious about a specific date?" enter and pull that down.

  attr_accessor :doc, :date, :history, :daily_thought, :date_english, :date_hebrew
  def initialize
    time = Time.new
    @date = time.strftime('%m/%d/%Y')
    @date[3] = '' if @date[3] == '0'
    @date[0] = '' if @date[0] == '0'

    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=#{@date}"))

    @history = {}
    jewish_history_hash
    @daily_thought = {}
    daily_thought_hash
    @date_english = doc.search('#PrimaryHeader').text
    @date_hebrew = doc.search('#SecondaryHeader > a').text
  end

  def jewish_history_hash
    doc.css('div#jewish_history.main div.link.header').each_with_index do |e, i|
      @history[e.text.to_s] = (doc.css("#JewishHistoryBody#{i} > p").map do
        |d| '' << d.text.to_s unless d.text.include?('Link')
      end.take 1).join.to_s
    end
  end

  def daily_thought_hash
    text = ''
    doc.css('#DailyThoughtBody0 p').each { |e| text << "#{e.text} \n\n" }
    text << doc.css('#footnotetable > div').text.to_s
    @daily_thought[doc.css('div.link.header.blue').text.delete! "\n" "\t"] = text.strip
  end

  def jewish_history?
    !history.empty?
  end

  def daily_thought?
    !daily_thought.empty?
  end
end
