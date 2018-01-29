class ExternalPin < ApplicationRecord

    validates :pin_uuid, presence: true
    validates :resolved, presence: true
end