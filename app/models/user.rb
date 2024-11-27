class User < ApplicationRecord
    has_secure_password
    has_many :watch_histories
    has_many :watched_products, through: :watch_histories, source: :product
end
