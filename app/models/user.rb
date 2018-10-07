class User < ApplicationRecord
  belongs_to :group, optional: true
  has_many :messages

  # has_secure_password validations: false
  # validates :password, presence: true, :if => :is_creator?
  validates :username, uniqueness: {scope: :group, case_sensitive: false}

  # private
  # def is_creator?
  #   is_creator == true
  # end
  def random_name
    randname = RandomAdjs.sample + "_" + RandomNouns.sample
    until !User.pluck(:username).include? randname do
      randname = RandomAdjs.sample + "_" + RandomNouns.sample
    end
    self.username=randname
  end
end
