require 'xmlsimple'

# this class parse
class XmlParser
  def call
    parse_xml
  end

private
  def parse_xml
    xml = File.read 'ACdelta20061pt2.xml'
    data = XmlSimple.xml_in xml

    data['product'].each do |product|
      @text = <<-TEXT
        isbn: b244 if its sibling b221 is 15
        title: #{product['title'][0]['b203'][0]}
        subtitle: b029
        publishing status: #{product['b394'][0]['content']}
        language: #{product['language'][0]['b252'][0]}
        publisher name: #{product['publisher'][0]['b081'][0]}
        author: is a contributor; #{product['contributor'][0]['b039'][0]} or #{product['contributor'][0]['b040'][0]} or b041 if its sibling #{product['contributor'][0]['b035'][0]} is A01
        number of pages: #{product['b061'][0]}
        publication_date: #{product['b003'][0]}
        product_form: #{product['b012'][0]}
        price: price in USD
        description: othertext #{product['othertext'][0]['d104'][0]['content']}
        height: measure #{product['measure'][0]['c094'][0]} if its sibbling #{product['measure'][0]['c093'][0]} is 01
        length: measure #{product['measure'][2]['c094'][0]} if its sibbling #{product['measure'][2]['c093'][0]} 03
        width: measure #{product['measure'][2]['c094'][0]} if its sibbling #{product['measure'][2]['c093'][0]} is 03
        weight: measure #{product['measure'][3]['c094'][0]} if its sibbling #{product['measure'][3]['c093'][0]} is 08
        bisac_code: b064 #{product['b064']}
        bisac_code2: subject b069 #{product['subject']}
        bisac_code3: next code available after bisac_code2
        media_file: mediafile

      TEXT
      puts @text
    end
  end
end

# x = XmlParser.new
# x.call