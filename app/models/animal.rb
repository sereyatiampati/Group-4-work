class Animal < ApplicationRecord
    validates :name, presence:true
    validates :age, presence:true, length: {minimum:1}
    validates :sound, presence:true

    def info
       "#{name}: #{age}years" 
    end
end
