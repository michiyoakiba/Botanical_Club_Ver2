class Plant < ApplicationRecord
    
  has_one_attached :image
  belongs_to :custemer
  has_many :plant_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :plant_name, presence: true
  validates :image, presence: true
  
  def get_image
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
     image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
  def self.search_for(content, method)
    if method == 'perfect'
      Plant.where(plant_name: content)
    elsif method == 'forward'
      Plant.where('plant_name LIKE ?', content+'%')
    elsif method == 'backward'
      Plant.where('plant_name LIKE ?', '%' + content)
    else
      Plant.where('plant_name LIKE ?', '%' + content + '%')
    end
  end
  
  validates :plant_name,presence:true
  validates :caption,presence:true,length:{ maximum:200}
  
end
