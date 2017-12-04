class Wiki < ApplicationRecord
  belongs_to :user
  # after_initialize :init

  # def init
  #   return unless new_record?
  #   self.status = ACTIVE
  # end
end
