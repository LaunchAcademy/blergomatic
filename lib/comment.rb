class Comment
  attr_reader :body, :author

  def initialize(body, author)
    @body = body
    @author = author
  end
end