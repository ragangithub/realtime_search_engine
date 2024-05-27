class Search < ApplicationRecord

    validates :query, presence: true, length: { minimum: 3, maximum: 60 }
    belongs_to :user
end
