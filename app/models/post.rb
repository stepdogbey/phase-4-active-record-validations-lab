class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction) }

    validate :title_is_clickbait


    TITLES = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]

  def title_is_clickbait
    if TITLES.none? { |t| t.match title }
      errors.add(:title, "Sorry title not present")
    end
  end
end
