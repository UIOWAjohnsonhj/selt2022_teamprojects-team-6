class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  belongs_to :student

  def self.destroy_old_resume(id)
    @resume = Resume.find_by(student_id: id)
    if @resume
      @resume.destroy
    end
  end
end
