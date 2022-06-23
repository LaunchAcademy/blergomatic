class Author

    attr_reader :first_name, :last_name
    attr_accessor :email

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
    end

    # basically what the reader makes
    # def first_name 
    #     @first_name
    # end


    def full_name
        return "#{@first_name} #{@last_name}"
    end

end
