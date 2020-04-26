# frozen_string_literal: true

class User < ApplicationRecord
    validates :first_name, presence :true, length: {minimum:3, maximum:100}

    validates :last_name, presence :true, length: {minimum:3, maximum:100}
    
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence :true, 
                      uniqueness: { case_sensitive: false  },
                      format: { with: EMAIL_REGEX }
end
