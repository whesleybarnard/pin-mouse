class ScheduledPin < ApplicationRecord
  validates :note, presence: true
  validates :link, presence: true
  validates :image_url, presence: true
  validates :status, presence: true
end