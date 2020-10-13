require 'pry'

class User
    attr_accessor :email, :age
    @@all_users = []

    def initialize(get_email,get_age)
        @email=get_email
        @age=get_age
        @@all_users << self
    end

    def self.all
        return @@all_users
    end

    
end

binding.pry
puts "end of file" 