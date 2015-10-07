require 'csv'
require 'HTTParty'
require 'nokogiri'


stock_data = HTTParty.get('http://finance.yahoo.com/q?s=AAPL')

parsed = Nokogiri::HTML(stock_data.body)

price_span = parsed.xpath("//span[@id='yfs_l84_aapl']")
live_price = price_span.first.content
prev_close = parsed.xpath("//div[@id='yfnc_tabledata1']")

puts "Apple stock is currently trading at $#{price_span.first.content} per share"
