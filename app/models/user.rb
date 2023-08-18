class User < ApplicationRecord

  ## Associations
  has_many :enrollments
  has_many :teachers, through: :enrollments
  has_many :programs, through: :enrollments

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
