class Course < ActiveRecord::Base
  belongs_to :subject
  
  validates_presence_of :courseID, :term, :subject, :enroll, :max_enroll, :timetables,
              message: I18n.t('activerecord.errors.models.blank')
  validates_uniqueness_of :courseID, message: I18n.t('activerecord.errors.models.taken')
  validate :valid_enroll

  private
  def valid_enroll
    if !enroll.blank? && !max_enroll.blank? && enroll > max_enroll
      errors.add "Số lượng đăng ký", " phải nhỏ hơn số lượng đăng ký tối đa."
    end
  end
end
