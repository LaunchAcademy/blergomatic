require 'spec_helper'

describe Author do
  let(:author) { Author.new('Terry', 'Pratchett') }

  it ".new" do
    expect(author).to be_a(Author)
  end

  describe "#first_name" do
    it 'returns the value of the first_name attribute' do
      expect(author.first_name).to eq('Terry')
    end
  end

  describe "#last_name" do
    it 'returns the value of the last_name attribute' do
      expect(author.last_name).to eq('Pratchett')
    end
  end

  describe "#full_name" do
    it 'returns the first and last name of the author as a string' do
      expect(author.full_name).to eq('Terry Pratchett')
    end
  end

  describe "#email" do
    it 'returns the value of the email attribute and write to that attribute' do
      email = 'user@example.com'
      author.email = email
      expect(author.email).to eq(email)
    end
  end
end
