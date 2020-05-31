class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      "User1234"
    end
  end

  
end
