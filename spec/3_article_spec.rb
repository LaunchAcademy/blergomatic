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

  it 'has an assignable title' do
    article = Article.new
    article.title = 'Linkbait'
    expect(article.title).to eq('Linkbait')
  end

  it 'has an assignable author' do
    article = Article.new
    article.author = author
    expect(article.author).to eq(author)
  end

  it 'has an assignable body' do
    article = Article.new
    article.body = 'something great'
    expect(article.body).to eq('something great')
  end

  it 'has a word count' do
    article = Article.new
    article.body = 'A five word thing say'
    expect(article.word_count).to eq(5)
  end

  it 'has a description that includes the author name' do
    expect(article.description.include?(author.full_name)).to eq(true)
  end

  it 'has a description that includes the title' do
    expect(article.description.include?(article.title)).to eq(true)
  end

  it 'has a list of comments' do
    expect(article.comments.class).to eq(Array)
  end

  it 'has a way to add a comment to the article' do
    comment = Comment.new('I am so smarrrrrrrt', author)
    article.add_comment(comment)
    expect(article.comments).to eq([comment])
  end

  it 'has a number of comments' do
    comment_1 = Comment.new('I am wicked smaht', author)
    comment_2 = Comment.new('look how knowledgeable I am', author)

    article.add_comment(comment_1)
    article.add_comment(comment_2)

    expect(article.comment_count).to eq(2)
  end

  it 'has a nonhardcoded number of comments' do

    comment_1 = Comment.new('I am wicked smaht', author)

    article.add_comment(comment_1)

    expect(article.comment_count).to eq(1)
  end

  context 'formatted_string' do
    before(:each) do
      comment_1 = Comment.new('I am wicked smaht', author)
      article.add_comment(comment_1)
    end

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

  context "spaceforce comments" do
    it "gives me a list of comments that include 'spaceforce'" do
      article.add_comment(Comment.new("spaceforce", author))
      article.add_comment(Comment.new("Regular comment", author))
      article.add_comment(Comment.new("spaceforce == awesome", author))

      expect(article.spaceforce_comments.count).to eq(2)
    end
  end
end
