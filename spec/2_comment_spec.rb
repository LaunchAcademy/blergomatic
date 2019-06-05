require 'spec_helper'

describe Comment do
  let(:body) { 'I am a troll and I am on the internet' }
  let(:author) { Author.new('RL', 'Stine') }
  let(:comment) { Comment.new(body, author) }
  
  it 'has a body' do
    expect(comment.body).to eq(body)
  end

  it 'has an author' do
    expect(comment.author).to eq(author)
  end

  it 'has an author that is not writable' do
    expect { comment.author = author }.to raise_error(NoMethodError)
  end

  it 'has a body that is not writable' do
    expect { comment.body = "Something Troll-ish" }.to raise_error(NoMethodError)
  end
end
