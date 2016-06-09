class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  self.per_page = 10
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 300 }
end
