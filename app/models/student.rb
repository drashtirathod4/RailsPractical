class Student < ApplicationRecord
  include DobValidation
  validates_presence_of :first_name, :last_name, :dob, :department
  validate :dob_cannot_be_in_the_future
  validates :department, inclusion: {in: %w{IT CE}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.department.blank? }
  validates :terms_of_usage, acceptance: {message: ": You cannot proceed without accepting Terms of Usage!" }, allow_nil: false 

  after_destroy :log_destroy_action
  after_destroy { |record| logger.info( "Student #{record.id} was destroyed." ) }
  before_validation :normalize_name, :remove_whitespaces, if: [:first_name?,:last_name?]
  after_validation :display_status
  after_destroy :display_reason, if: Proc.new { |student| student.first_name == "Xyz" }
  before_validation :check_dob, if: Proc.new { |student| student.errors[:dob] }

  after_initialize do |student|
    puts "Object initialized"
  end

  after_find do |student|
    puts "Student found"
  end

  after_create do |student|
    puts "Student #{student.first_name} #{student.last_name} created"
  end

  after_update do |student|
    puts "Student updated"
  end

  def log_destroy_action
    puts "Student Deleted!"
  end

  def check_dob
    puts "Before DOB Validation"
  end
  
  after_save do |student|
    puts "Email Validated"
  end

  private
  def normalize_name
      self.first_name  = first_name.downcase.titleize
      self.last_name = last_name.downcase.titleize
  end

  def remove_whitespaces
      first_name.strip!
      last_name.strip!
  end

  def display_status
    puts "Validated"
  end

  def display_reason
    puts "#{self.first_name} is deleted beacuse its not allowed!"
  end

  def check_dob
    puts "Callback before Validating DOB!"
    puts "DOB is not valid!"
  end
end
