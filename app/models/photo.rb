class Photo < ActiveRecord::Base
  acts_as_votable
  attr_accessor :status
  
  has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:styles/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  
  has_many :comments
  
  belongs_to :user
  
  
end
