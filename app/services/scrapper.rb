require "open-uri"
require "nokogiri"
require 'httparty'

class Scrapper
  def initialize(url)
    @url = url
  end

  def call
    if @url.include?("leboncoin.fr")
      leboncoin_scrapper
    elsif @url.include?("vinted.fr") || @url.include?("vinted.com")
      vinted_scrapper
    else
      raise "Site non supporté"
    end
  end

  private

  def vinted_scrapper
    document = Nokogiri::HTML(URI.open(@url))
    title = document.css("div[itemprop='name']").text.strip
    price = document.css("div[data-testid='item-price']").text.strip
    image_urls = document.css(".item-photos img").map { |img| img['src'] }
    {
      title: title,
      price: price,
      image_urls: image_urls,
      url: @url
    }
  end

  def leboncoin_scrapper
    headers = {
    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36",
    "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
    "Accept-Language" => "en-US,en;q=0.5",
    "Accept-Encoding" => "gzip, deflate, br",
    "Connection" => "keep-alive",
    "Upgrade-Insecure-Requests" => "1"
  }
  response = HTTParty.get(@url, headers: headers)
  document = Nokogiri::HTML(response.body)

    title = document.css("h1[data-qa-id='adview_title']").text.strip

    price = document.css("p.text-headline-2").text.strip

    image_urls = document.css("section[data-qa-id='adview_spotlight_container'] picture img").map do |img|
      img['src']
    end
    unique_image_urls = image_urls.uniq


    {
      title: title,
      price: price,
      image_urls: unique_image_urls,
      url: @url
    }
  end
end
