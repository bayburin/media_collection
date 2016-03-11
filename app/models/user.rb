class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :collection, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_collection, :set_username

  def username
    # email.match(/(\w+)@.*/)[1]
    email.split('@').first
  end

  private

  def create_collection
    Collection.create(user: self)
  end

  def set_username
    # self.update_column :user_name, email.split('@').first
  end

end
