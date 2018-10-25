class Review < ApplicationRecord
    belongs_to :ride 
    belongs_to :user 

    validates :title, presence: :true, length: {in: 2..50} 
    validates :rating, presence: :true 
    validates :content, presence: :true, length: {minimum: 2}
end
