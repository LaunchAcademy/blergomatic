class Author

    attr_reader(:first_name, :last_name)
    attr_accessor(:email)

    def initialize(first_name_string, last_name_string)
        @first_name = first_name_string
        @last_name = last_name_string
    end

    def full_name 
        return "#{first_name} #{last_name}"
    end

    # def first_name 
    #     return @first_name
    # end

    # def last_name 
    #     return @last_name
    # end


end