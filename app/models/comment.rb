class Comment < ActiveRecord::Base
  belongs_to :photo
  validates :content, presence: true
  scope :active, -> {where status: 1}
end
