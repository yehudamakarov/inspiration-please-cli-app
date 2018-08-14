class InspirationPlease::DatePage

  attr_accessor :doc, :todays_date, :history, :daily_thought, :date_english, :date_hebrew
  
  def initialize
    time = Time.new
    @todays_date = time.strftime('%m/%d/%Y')
    @todays_date[3] = '' if @todays_date[3] == '0'
    @todays_date[0] = '' if @todays_date[0] == '0'

    @doc = Nokogiri::HTML(open("https://www.chabad.org/calendar/view/day.asp?tdate=#{@todays_date}"))

    @history = {}
    jewish_history_hash_scrape

    @daily_thought = {}
    daily_thought_hash_scrape

    @date_english = doc.search('#PrimaryHeader').text
    @date_hebrew = doc.search('#SecondaryHeader > a').text

  end

  def jewish_history_hash_scrape
    doc.css('div#jewish_history.main div.link.header').each_with_index do |e, i|
      @history[e.text] = doc.css("#JewishHistoryBody#{i} > p").map do |d|
        d.text unless d.text.include?('Link')
      end.join
    end
  end

  def daily_thought_hash_scrape
    text = ''
    doc.css('#DailyThoughtBody0 p').each { |e| text << "#{e.text} \n\n" }
    text << doc.css('#footnotetable > div').text
    @daily_thought[doc.css('div.link.header.blue').text.delete! "\n" "\t"] = text.strip
  end

  def jewish_history?
    !history.empty?
  end

  def daily_thought?
    !daily_thought.empty?
  end
end
