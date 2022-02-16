class Faculty < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone, :email, :dob, :designation
  validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
  validate :dob_cannot_be_in_the_future
  validates :designation, inclusion: {in: %w{Ass.Prof. Prof.}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.designation.blank? }
  include DobValidation 

  before_validation :normalize_name, :remove_whitespaces, if: :first_name?, if: :last_name
  after_validation :display_status
  after_destroy { |record| logger.info( "Faculty #{record.id} was destroyed." ) }
  after_destroy :display_reason, if: Proc.new { |faculty| faculty.first_name == "Xyz" }
  after_validation :check_dob, if: Proc.new { |faculty| faculty.errors[:dob] == [] }

  after_initialize do |faculty|
    puts "Object initialized"
  end

  after_find do |faculty|
    puts "Faculty found"
  end

  after_create do |faculty|
    puts "Faculty #{faculty.first_name} #{faculty.last_name} created"
  end

  after_update do |faculty|
    puts "Faculty updated"
  end
  
  private
  def check_dob
    puts "After DOB Validation"
  end

  after_save do |faculty|
    puts "Email Validated"
  end
  
  def normalize_name
      self.first_name  = first_name.downcase.titleize
      self.last_name = last_name.downcase.titleize
  end

  def remove_whitespaces
      first_name.strip!
      last_name.strip!
  end

  def display_reason
    puts "#{self.first_name} is deleted!"
  end
  
  def display_status
    puts "Validated"
  end

  def check_dob
    puts "Callback after validating DOB!"
    puts "DOB is valid!"
  end
end
