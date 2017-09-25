class Post < ActiveRecord::Base

  class BuzzValidator < ActiveModel::Validator
    def validate(record)
      result = /Won't Believe|Secret|Guess|Top \d/i.match(record.title)
      if !result
        record.errors[:title] << "Missing key buzzwords in your title"
      end
    end
  end

  validates :title, presence: true, buzz: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validates_with BuzzValidator

end
