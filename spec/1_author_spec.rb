require 'spec_helper'

describe Author do
  let(:author) { Author.new('Terry', 'Pratchett') }

  it ".new" do
    expect(author).to be_a(Author)
  end

  describe "#first_name" do
    it 'is a reader for first_name' do
      expect(author.first_name).to eq('Terry')
    end
  end

  describe "#last_name" do
    it 'is a reader for last_name' do
      expect(author.last_name).to eq('Pratchett')
    end
  end

  describe "#full_name" do
    it 'returns the first and last name of the author' do
      expect(author.full_name).to eq('Terry Pratchett')
    end
  end

  describe "#email" do
    it 'has an accessor for email' do
      email = 'user@example.com'
      author.email = email
      expect(author.email).to eq(email)
    end
  end
end
