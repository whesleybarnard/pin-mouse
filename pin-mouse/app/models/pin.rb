class Pin
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Dirty
  extend ActiveModel::Naming

  attr_accessor :note, :url, :image, :link

  def initialize(attributes = nil)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end