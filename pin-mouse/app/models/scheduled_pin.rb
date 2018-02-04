class ScheduledPin < ApplicationRecord
  def self.schedule_groups
    {minutes_15: 'Every 15 minutes'}
  end

  def self.schedule_status
    {
        to_be_scheduled: 'To be scheduled',
        scheduled: 'Scheduled',
        pinned: 'Pinned'
    }
  end

  validates :note, presence: true
  validates :link, presence: true
  validates :image_url, presence: true
  validates :status, presence: true
end