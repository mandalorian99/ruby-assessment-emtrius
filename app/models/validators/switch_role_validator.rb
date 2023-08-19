## Custom Validator to check weather a user can switch role or not.
# If a user already enrolled or teaching can't switch role in between

class SwitchRoleValidator < ActiveModel::Validator
  def validate(resource)
    unless resource.enrollments.empty?
      resource.errors.add(:base, "Kind can not be teacher because is studying in at least one program")
    end

    unless resource.teacher_enrollments.empty?
      resource.errors.add(:base, "Kind can not be student because is teaching in at least one program")
    end
  end
end