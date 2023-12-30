class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def status_label
    is_active? ? '有効' : '退会'
  end
  
  def fullname
    last_name + "　" + first_name
  end
  
  def fullname_kana
    last_name_kana + "　" + first_name_kana
  end
end
