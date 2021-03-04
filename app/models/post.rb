class Post < ApplicationRecord
    validates :first, presence: true
    validates :second, presence: true
    validates :third, presence: true
end
