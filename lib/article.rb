class Article
  attr_accessor :title, :author, :body
  attr_reader :comments

  def initialize
    @title = nil
    @author = nil
    @body = nil
    @comments = []
  end

  def add_comment(comment)
    @comments << comment
    # @comments.push(comment)
  end

  def word_count
    # binding.pry
    @body.split.count
  end

  def description
    "#{@author.full_name} #{@title}"
  end

  def comment_count
    @comments.length
  end

  def formatted_string
    "#{description} #{comment_count} #{@body}"
  end

  def meme_comments
    count = 0
    @comments.each do |comment|
      if comment.body.include?("meme")
        count += 1
      end
    end
    return count
  end
end