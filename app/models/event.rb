class Event < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments, as: :commentable
    has_many :registers
    validates_presence_of :name, :description, :event_date, :user_id, :category_id
    validate :event_cannot_be_in_the_past

    # for validating event date : user can't select date in past
    def event_cannot_be_in_the_past
        if event_date.present? && event_date < Date.today
          errors.add(:event_date, "Event can't be in past!")
        end
    end

    # For seacrh event by category name
    def self.search(search)
        if search
            category = Category.find_by(name: search.titleize)
            if category
                self.where(category_id: category)
            else
                Event.all
            end
        else
            Event.all
        end
    end
end
