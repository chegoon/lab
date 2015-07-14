class Video < ActiveRecord::Base
  belongs_to :channel
  has_one :video_content_detail, dependent: :destroy
  has_many :video_statistics, dependent: :destroy

  self.per_page = 30

end
