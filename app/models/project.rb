class Project < ApplicationRecord
  #has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }

  before_create private def generate_and_set_code
    loop do
      name_chars = name.to_s.gsub(/\s+/, "").upcase.chars
      self.code = name_chars.first(2).join + name_chars.sample + rand(10).to_s
      break unless Project.exists?(code: code)
    end
  end
end
