require 'spec_helper'

describe Comment do
  let(:body) { 'I am a troll and I am on the internet' }
  let(:author) { Author.new('R.L.', 'Stine') }
  let(:comment) { Comment.new(body, author) }

  describe ".new" do
    it "returns a Comment object" do
      expect(comment).to be_a(Comment)
    end
  end

  describe "#body" do
    it 'returns the value of the body attribute' do
      expect(comment.body).to eq(body)
    end

    it 'does not allow the writing of the body attribute' do
      expect { comment.body = "Something Troll-ish" }.to raise_error(NoMethodError)
    end
  end

  describe "#author" do
    it 'returns the value of the author attribute' do
      expect(comment.author).to eq(author)
    end

    it 'does not a allow writing of the author attribute' do
      author_two = Author.new('Neil', 'Gaiman')
      expect { comment.author = author_two }.to raise_error(NoMethodError)
    end
  end
end
