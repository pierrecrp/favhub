require "open-uri"
require "nokogiri"
# require "selenium-webdriver"

class Scrapper
  def initialize(url)
    @url = url
  end

  # def call
  #   options = Selenium::WebDriver::Chrome::Options.new
  #   options.add_argument('--disable-gpu')
  #   options.add_argument('enable-logging')
  #   options.add_argument('start-maximized')
  #   options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.53 Safari/537.36')
  #   options.add_argument('--disable-blink-features=AutomationControlled')

  #   # Créer une instance de navigateur Chrome avec les options spécifiées
  #   driver = Selenium::WebDriver.for :chrome, options: options

  #   # Exécuter un script JavaScript pour masquer la détection de l'automatisation
  #   driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")

  #   driver.navigate.to(@url)
  #   page_source = driver.page_source
  #   document = Nokogiri::HTML(page_source)

  #   title = document.css("h1[data-qa-id='adview_title']").text.strip

  #   price = document.css("span[data-qa-id='adview_price']").text.strip

  #   image_urls = document.css("div[data-qa-id='adview_spotlight_container'] img").map { |img| img['src'] }

  #   {
  #     title: title,
  #     price: price,
  #     image_urls: image_urls,
  #     url: @url
  #   }
  # end

  def call

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
end
