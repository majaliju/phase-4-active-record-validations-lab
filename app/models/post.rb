class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :clickbaiter

  def clickbaiter
    unless title.match(/(Won't Believe)|(Top \d)|(Secret)|(Guess)/)
      errors.add(:title, "Come on you know how this business works!")
  end
  
  
end
