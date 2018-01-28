class Board
  include ActiveModel::Model

  attr_accessor :board_uuid, :name

  validates :board_uuid, presence: true
  validates :name, presence: true
end