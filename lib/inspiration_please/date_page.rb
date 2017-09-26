class InspirationPlease::DatePage

  attr_accessor :doc, :date

  def initialize
    # time = Time.new
    # @date = time.strftime("%m/%d/%Y")
    # @date[0] = '' if @date[0] == '0'
    # date is now the end of the url for today's date_page

    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=9/28/2017"))
  end

  def daily_thought
    puts "THIS IS GOING TO BE THE DAILY THOUGHT. css selector for the daily_thought will puts the daily_thought"
  end

  def jewish_history
    binding.pry
    
    puts "THIS IS GOING TO BE THE JEWISH HISTORY OF TODAY. css selector for the jewish_history will puts the jewish_history"
  end
end

# doc.css("div#jewish_history.main div.link.header") - list of today's events. #each |e| e.text

# doc.css("#jewish_history").children[5].text - will always be the first title

# doc.css("#jewish_history").children[7].css("p").children[0].text

# doc.css("#jewish_history").children[9].text - will always be the 2nd title
#jewish_history > div:nth-child(3)

#JewishHistoryBody1 > p

# doc.css("div#jewish_history.main div.link.header").length -- how many events there are today

# doc.css("div#jewish_history.main div.link.header").each_with_index do |e, i|
#   puts e.text
#   puts doc.css("#JewishHistoryBody#{i} > p").text
# end
