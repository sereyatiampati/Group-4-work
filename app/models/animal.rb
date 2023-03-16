class Animal < ApplicationRecord
    validates :name, presence:true, length: {minimum:3}
    validates :age, presence:true
    validates :sound, presence:true

    def info    
       "#{name}: #{age}years" 
    end
end
