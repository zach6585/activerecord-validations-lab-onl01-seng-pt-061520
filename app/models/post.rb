

class Post < ActiveRecord::Base
    validate :clickbaiter, on: :create
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
   


    def clickbaiter
        if title == nil  
            errors.add(:title, "Can't be empty")
        elsif !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top" + /[0-9]/.to_s) && !title.include?("Guess")
            errors.add(:title, "Not clickbaity enough")
        end 
        
    end 
end




