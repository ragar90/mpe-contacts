class Contact < ActiveRecord::Base
  attr_accessible :cellphone, :comunity, :lastname, :name, :phone
  belongs_to :user
end
