class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :update_user_karma_score

  protected

  def update_user_karma_score
  	user = User.find(user_id)
  	karma_score = user.karma_score + value
  	user.update_attribute(:karma_score, karma_score)
  end
end
