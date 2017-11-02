class Guitar < ApplicationRecord
  has_attached_file :image, styles: { medium: "200x200>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  belongs_to :user
  has_many :bids, dependent: :destroy
  has_many :comments, dependent: :destroy


  scope :active, -> {where('auction_end > ?', Date.today)}
  scope :past, -> {where('auction_end < ?', Date.today)}
  
  def self.won(user)
    if user
      guitars = Guitar.past.where.not(user: user)
      result = []
      guitars.each do |g|
        result.push g if g.highest_bid && g.highest_bid.user == user
      end
      result
    else
      []
    end
  end
  
  def highest_bid 
    self.bids.order("amount DESC").first
  end

end
