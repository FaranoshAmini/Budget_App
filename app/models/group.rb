class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities, foreign_key: :group_id
  has_many :entities, through: :group_entities, foreign_key: :group_id
  validates :name, presence: true
  def total_amount
    total = 0
    entities.each do |t|
      total += t.amount
    end
    total
  end

  def date
    date = ''
    date += created_at.day.to_s
    date += (Date::ABBR_MONTHNAMES[created_at.month]).to_s
    date += created_at.year.to_s
    date
  end
end
