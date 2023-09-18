module Prozable
  require 'nokogiri'
  require 'open-uri'

  def source_values
    [parse_native_language, parse_country, parse_target_language, parse_name]
  end

  def check_source
    Nokogiri::HTML5(URI.open(@extraction.source))
  rescue StandardError => e
    flash.now[:alert] = e.message
  end

  def error_message
    "undefined method `css' for false:FalseClass"
  end

  private

  def parse_source
    @parse_source ||= check_source
  end

  def parse_native_language
    parse = parse_source.css('.pd_bot').text
    parse.split(' ')[4].length > 3 ? parse.split(' ')[4].split(',').first.chop! : parse.split(' ')[5].split(',').first.chop!
  end

  def parse_name
    parse_source.css('font').css('strong').text.split(' ')
  end

  def parse_country
    parse = parse_source.css('#tagline')
    arr = []
    parse.each do |country|
      arr << country.next_element.next_element.next_element.inner_html.split('<').first.split(',').last.strip!
    end
    arr
  end

  def parse_target_language
    languages = parse_source.css('#lang_full').css('span').text.split(/(?=[A-Z])/)
    languages.select { |element| element.include? 'to' }.uniq.each { |s| s.gsub!(/ * to/, '') }
  end
end
