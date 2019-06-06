require 'spec_helper'

describe Comment do
  let(:body) { 'I am a troll and I am on the internet' }
  let(:author) { Author.new('R.L.', 'Stine') }
  let(:comment) { Comment.new(body, author) }

  describe ".new" do
    expect(comment).to be_a(Comment)
  end

  describe "#body" do
    it 'is a reader for body' do
      expect(comment.body).to eq(body)
    end

    it 'is not a writer method' do
      expect { comment.body = "Something Troll-ish" }.to raise_error(NoMethodError)
    end
  end

  describe "#author" do
    it 'is a reader method for author' do
      expect(comment.author).to eq(author)
    end

    it 'cannot change the value of author (not writeable)' do
      author_two = Author.new('Neil', 'Gaiman')
      expect { comment.author = author_two }.to raise_error(NoMethodError)
    end
  end
end
