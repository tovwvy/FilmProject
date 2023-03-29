class Film < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :year}
end