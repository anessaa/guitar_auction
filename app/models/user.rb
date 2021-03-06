class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_attached_file :image, styles: { medium: "200x200>", thumb: "250x250>" }, presence: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    has_many :guitars
    has_many :bids
    has_many :guitars_bid_on, through: :bids, source: :bid
end
