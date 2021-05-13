class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user

    validates :petname, presence: true
    validates :age, presence: true
    validates :description, presence: true
    validates :species, presence: true
end
