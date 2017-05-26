class Category < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: { message: "category name" }
  

  # relationship
  # belongs_to :category_group
  has_many :products


  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end


  scope :published, -> { where(is_hidden: false) }

end
