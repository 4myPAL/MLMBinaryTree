class User < ActiveRecord::Base
  
  REFERRAL_BY_COLUMN = 'referral_by_id'
  
  belongs_to :referral, class: User, foreign_key: REFERRAL_BY_COLUMN
  has_one :network
  has_many :referrals, class: User, foreign_key: REFERRAL_BY_COLUMN
  
end
