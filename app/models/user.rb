class User < ApplicationRecord

  ## Associations
  has_many :enrollments
  has_many :teachers, through: :enrollments
  has_many :programs, through: :enrollments

  ## scopes
  scope :favorites, ->{ left_outer_joins(:enrollments).where("enrollments.favorite = ?",  true) }

  ## enums
  enum :kind, ['student', 'teacher', 'student_teacher']
  
  class << self
    def classmates(user)
      left_outer_joins(enrollments: :program)
      .where("programs.id IN (?) ", user.programs.ids)
      .where.not("users.id = ?", user.id)
      .uniq
    end
  end
end
