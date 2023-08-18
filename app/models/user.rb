class User < ApplicationRecord

  ## Associations
  has_many :enrollments
  has_many :teachers, through: :enrollments
  has_many :programs, through: :enrollments

  ## scopes
  scope :favorites, ->{ left_outer_joins(:enrollments).where("enrollments.favorite = ?",  true) }

  class << self
    def classmates(user)
      classmate_ids = Enrollment
                    .where(program_id: user.program_ids)
                    .where
                    .not(user: user )
                    .map(&:user_id)

      User.where(id: classmate_ids)
    end
  end
end
