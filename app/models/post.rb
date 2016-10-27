class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}

  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    statements = ["Won't Believe", "Secret", "Guess"]
    if self.title
      if statements.none? {|click| self.title.include?(click)}
        errors.add(:title, "clickbait")
      end
    end
  end



end
