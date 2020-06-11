require 'spec_helper'

describe Article do
  let(:author) { Author.new('Roald', 'Dahl') }
  let(:article) do
    article = Article.new
    article.author = author
    article.title = 'Something epic'
    article.body = 'A really long post about nothing'
    article
  end

  # in this case, we are only allowing an Article to be started as a draft, without initial arguments!
  # instead, we can write to them after initialization. This is to give clarity on the flexibility of the initialize method and writing in
  # instance variables that didn't previously exist on creation!

  describe "#title" do
    it 'returns the value of the title attribute or writes to the title attribute' do
      article = Article.new
      article.title = 'Linkbait'
      # instance variables can be created even if they were not defined in "#initialize"
      expect(article.title).to eq('Linkbait')
    end
  end

  describe "#author" do
    it 'returns the value of the author attribute or writes to the author attribute' do
      article = Article.new
      article.author = author
      # Hint: we can use writers to assign an object to an instance variable
      expect(article.author).to eq(author)
    end
  end

  describe "#body" do
    it 'returns the value of the body attribute or writes to the body attribute' do
      article = Article.new
      article.body = 'something great'
      expect(article.body).to eq('something great')
    end
  end

  describe "#comments" do
    it 'has a reader for the comments attribute, that returns an array of possible comment objects for this article' do
      expect(article.comments.class).to eq(Array)
    end
  end

  describe "#add_comment" do
    it 'adds a comment to the array of comments for the article' do
      comment = Comment.new('I am so smarrrrrrrt', author)
      article.add_comment(comment)
      expect(article.comments).to eq([comment])
    end
  end

  describe "#word_count" do
    it 'returns the number of words in the article body' do
      article = Article.new
      article.body = 'This article is all about aliens'
      expect(article.word_count).to eq(6)
    end
  end

  describe "#description" do
    it 'returns a string with the author name and article title' do
      expect(article.description.include?(article.title)).to eq(true)
      expect(article.description.include?(author.full_name)).to eq(true)
    end
  end

  describe "#comment_count" do
    it 'returns the number of comments' do
      comment_1 = Comment.new('great article', author)
      comment_2 = Comment.new('I truly disliked this article', author)

      article.add_comment(comment_1)
      article.add_comment(comment_2)

      expect(article.comment_count).to eq(2)
    end

    it 'has a nonhardcoded number of comments' do
      comment_1 = Comment.new('I am wicked smaht', author)

      article.add_comment(comment_1)

      expect(article.comment_count).to eq(1)
    end
  end

  describe '#formatted_string' do
    context "returns a large string of information about the article"

    before(:each) do
      comment_1 = Comment.new('I am wicked smaht', author)
      article.add_comment(comment_1)
    end
    # before each allows us to run some code before each it block

    it 'includes the title' do
      expect(article.formatted_string.include?(article.title)).to eq(true)
    end

    it 'includes the author' do
      expect(article.formatted_string.include?(article.author.full_name)).to eq(true)
    end

    it 'includes the number of comments' do
      expect(article.formatted_string.include?('1')).to eq(true)
    end

    it 'includes the body' do
      expect(article.formatted_string.include?(article.body)).to eq(true)
    end
  end

  context "#meme_comments" do
    it "returns the number of article comments that include the word 'meme'" do
      article.add_comment(Comment.new("meme-ify me captain", author))
      article.add_comment(Comment.new("Regular comment (snore)", author))
      article.add_comment(Comment.new("This article should be about memes and how dank they can be", author))

      expect(article.meme_comments).to eq(2)
    end
  end
end
