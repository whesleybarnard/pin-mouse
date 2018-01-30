class ExternalPin < ApplicationRecord

    validates :pin_uuid, presence: true
    validates :resolved, :inclusion => { :in => [true, false] }
end