class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :comments 


  def admin?
    is_admin
  end

  #------- add to collection relationship -------
  has_many :collections
  has_many :participated_products, through: :collections, source: :product

  def is_member_of?(product)
    participated_products.include?(product)
  end

  def join_collection!(product)
    participated_products << product
  end

  def quit_collection!(product)
    participated_products.delete(product)

  end


end
