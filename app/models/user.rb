class User < ApplicationRecord

  ## Associations
  has_many :enrollments
  has_many :teachers, through: :enrollments
  has_many :programs, through: :enrollments
end
