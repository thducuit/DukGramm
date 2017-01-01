class Photo < ActiveRecord::Base
  acts_as_votable
  attr_accessor :status
  
  has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:styles/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  
  has_many :comments
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  
  def tag_list=(labels)
    self.tags = labels.split(',').map do |label|
      Tag.where(label: label.gsub(/\s+/, '').strip).first_or_create!
    end
  end
  
  def tag_list
    self.tags.map(&:label).join(', ')
  end
  
  def self.tag_with(name)
    Tag.find_by_label!(name).photos
  end
  
end
