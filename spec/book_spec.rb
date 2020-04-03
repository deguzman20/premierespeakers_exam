require 'spec_helper'
require './book'

describe Book do
  let(:book) { described_class.new('harry potter') }

  it 'check the response' do
    expect(book.call).not_to be_nil
  end
end