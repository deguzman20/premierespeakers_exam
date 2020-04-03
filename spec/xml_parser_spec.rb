require 'spec_helper'
require './xml_parser'

describe XmlParser do
  let(:xml_parser) { described_class.new }

  it 'check the response' do
    expect(xml_parser.call).not_to be_nil
  end
end