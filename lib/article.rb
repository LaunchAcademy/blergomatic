class Article 

  attr_accessor :title, :author, :body
  attr_reader :comments

  def initialize 
    @title = nil 
    @author = nil 
    @body = nil
    @comments = []
  end

  # def comments 
  #   return @comments 
  # end

  def add_comment(comment_object)
    @comments << comment_object
  end

  def word_count 
    @body.split.length
  end

  def description 
    return "#{@author.full_name} #{@title}"
  end

  def comment_count 
    @comments.count
  end

  def formatted_string 
    "#{@title} #{@author.full_name} comments: #{comment_count} #{body}"
  end

  def meme_comments
    meme_count = 0
    @comments.each do |comment_object| 
      if comment_object.body.include?("meme")
        meme_count += 1
      end
    end

    return meme_count

  end


end

# article = Article.new 
# article.title = "The Expanse"