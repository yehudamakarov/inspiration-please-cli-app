class InspirationPlease::DatePage

  attr_accessor :doc, :date

  def initialize
    time = Time.new
    @date = time.strftime("%m/%d/%Y")
    @date[3] = '' if @date[3] == '0'
    @date[0] = '' if @date[0] == '0'
    @doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/view/day.asp?tdate=9/4/2017"))
  end

  def daily_thought
    puts ""
    header = doc.css("div.link.header.blue").text
    header.delete! "\n" "\t"
    puts "-------------#{header}-------------"
    puts ""
    doc.css("#DailyThoughtBody0 p").each do |e|
      puts "#{e.text}"
      puts ""
    end
    puts""
    puts "#{doc.css("#footnotetable > div").text}"
    puts ""
  end

  def jewish_history
    if doc.css("div#jewish_history.main div.link.header").empty?
      puts ""
      puts "Today in Jewish History is a canvas waiting to be painted by you. Try the daily thought. :) "
      puts ""
    else
      doc.css("div#jewish_history.main div.link.header").each_with_index do |e, i|
        puts "-------------#{e.text}-------------"
        a = doc.css("#JewishHistoryBody#{i} > p")
        binding.pry
        # a.pop if a[-1].text.start_with?("Link")
        puts "#{a.text}"
        puts ""
      end
    end
  end
end
