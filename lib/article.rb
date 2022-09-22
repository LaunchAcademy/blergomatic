class Article 

  attr_reader :comments
  attr_accessor :title, :author, :body

  def initialize
    @title = nil
    @author = nil 
    @body = nil 
    @comments = []
  end

  def add_comment(new_comment_object)
    @comments << new_comment_object
  end

  def word_count 
    @body.split.length
  end 

  def description 
    return "#{@title} #{@author.full_name}"
  end

  def comment_count 
    @comments.count 
  end

  def formatted_string 
    starter_string = ""
    starter_string += "#{description}\n"
    starter_string += "#{comment_count}\n"
    starter_string += "#{comment_count}\n"
    starter_string += "#{body}\n"
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