require "open-uri"
require "nokogiri"
require 'httparty'

class Scrapper
  def initialize(favorite)
    @favorite = favorite
  end

  def call
    if @favorite.source == "leboncoin"
      leboncoin_scrapper
    else
      vinted_scrapper
    end
  end

  private

  def vinted_scrapper
    document = Nokogiri::HTML(URI.open(@favorite.url))
    title = document.css("div[itemprop='name']").text.strip
    description = document.css("div[itemprop='description']").text.strip
    price = document.css("div[data-testid='item-price']").text.strip
    image_urls = document.css(".item-photos img").map { |img| img['src'] }

    @favorite.name = title
    @favorite.description = description
    @favorite.price = price.to_i
    image_urls.each do |image|
      file = URI.open(image)
      @favorite.photos.attach(io: file, filename: @favorite.name, content_type: 'images/png')
    end
    @favorite.save
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
    response = HTTParty.get(@favorite.url, headers: headers)
    document = Nokogiri::HTML(response.body)

    title = document.css("h1[data-qa-id='adview_title']").text.strip
    description = document.css("div[data-qa-id='adview_description_container']").text.strip
    price = document.css("p.text-headline-2").text.strip

    # image_urls = document.css("section[data-qa-id='adview_spotlight_container'] picture img").map do |img|
    #   img['src']
    # end
    # unique_image_urls = image_urls.uniq

    image_urls = document.css("._1cnjm").map do |img|
      img['src']
    end

    unique_image_urls = image_urls.uniq

    @favorite.name = title
    @favorite.description = description
    @favorite.price = price.to_i
    unique_image_urls.each do |image|
      file = URI.open(image)
      @favorite.photos.attach(io: file, filename: @favorite.name, content_type: 'images/png')
    end

    @favorite.save
  end
end
