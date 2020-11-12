class Congressperson < ApplicationRecord

  has_many :spents
  has_many :yearly_spends


  def max_spent
    self.spents.map(&:value).max.to_f
  end
end
