class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic

  def full_name
    "#{first_name} #{last_name}"
  end

  
end
