require 'xmlsimple'

# this class parse
class XmlParser
  def call
    parse_xml
  end

private
  def parse_xml
    xml = File.read 'ACdelta20061pt2.xml';
    data = XmlSimple.xml_in xml
    pp data

    # data["product"].each do |v|
    #   pp v["title"]
    #   @text = <<-TEXT
    #     isbn: b244 if its sibling b221 is 15
    #     title: #{v["title"]}
    #     subtitle: b029
    #     publishing status: b394
    #     language: b252
    #     publisher name: b081
    #     author: is a contributor; b039 or b040 or b041 if its sibling b035 is A01
    #     number of pages: b061
    #     publication_date: b003
    #     product_form: b012
    #     price: price in USD
    #     description: othertext d104
    #     height: measure c094 if its sibbling c093 is 01
    #     length: measure c094 if its sibling c093 is 03
    #     width: measure c094 if its sibling c093 is 03
    #     weight: measure c094 if its sibling c093 is 08
    #     bisac_code: b064
    #     bisac_code2: subject b069
    #     bisac_code3: next code available after bisac_code2
    #     media_file: mediafile f117

    #   TEXT
    #   # puts @text
    # end
    # pp "sample"
    # pp data
    # pp "sample"
  end
end


x = XmlParser.new
x.call