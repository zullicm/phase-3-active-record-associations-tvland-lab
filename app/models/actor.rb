class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    names = characters.map do |char|
      char.name
    end

    show_names = shows.map do |show|
      show.name
    end

    "#{names[0]} - #{show_names[0]}"

  end
end