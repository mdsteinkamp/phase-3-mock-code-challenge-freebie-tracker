class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
  end

  def self.oldest_company
    "#{self.all.first.name} in #{self.all.first.founding_year}"
  end

end
