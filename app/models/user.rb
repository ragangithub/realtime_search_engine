class User < ApplicationRecord

    validates :ip_address, presence: true
    has_many :searches
end
