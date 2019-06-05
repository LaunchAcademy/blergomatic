require 'spec_helper'

describe Author do
  let(:author) { Author.new('Terry', 'Pratchett') }
  it 'has a first name' do
    expect(author.first_name).to eq('Terry')
  end

  it 'has a last name' do
    expect(author.last_name).to eq('Pratchett')
  end

  it 'has a full name' do
    expect(author.full_name).to eq('Terry Pratchett')
  end

  it 'has an email' do
    email = 'user@example.com'
    author.email = email
    expect(author.email).to eq(email)
  end
end
