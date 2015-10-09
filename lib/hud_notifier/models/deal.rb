class Deal < ActiveRecord::Base
  validates :hud_id, :url, :title, presence: true
  validates :hud_id, uniqueness: true
end
