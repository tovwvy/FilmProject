class Film < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :year}
    
    has_many :comments
end