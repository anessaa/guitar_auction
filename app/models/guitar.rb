class Guitar < ApplicationRecord
  has_attached_file :image, styles: { medium: "200x200>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  belongs_to :user
  has_many :bids

  scope :active, -> {where('auction_end > ?', Date.today)}
  scope :past, -> {where('auction_end < ?', Date.today)}
end
