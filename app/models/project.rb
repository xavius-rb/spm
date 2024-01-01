class Project < ApplicationRecord
  #has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }
  validates :details, presence: true, length: { minimum: 5 }
end
