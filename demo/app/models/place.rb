class Place < ActiveRecord::Base
  attr_accessible :active, :name, :published_at

  scope :published, where('published_at < ?', Time.now)
end
