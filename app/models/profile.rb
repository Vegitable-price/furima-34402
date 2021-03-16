class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :birth_day
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
