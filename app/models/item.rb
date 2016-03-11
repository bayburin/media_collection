class Item < ActiveRecord::Base
  belongs_to :collection

  has_attached_file :image, styles: { medium: '200x200>', small: '100x100'}, default_url: ActionController::Base.helpers.asset_path("noimage.jpg")
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  validates :description, :collection, presence: true
end
