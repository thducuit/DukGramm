class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates :content, presence: true
  scope :active, -> {where status: 1}
end
