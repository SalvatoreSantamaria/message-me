class Message < ApplicationRecord
    belongs_to :user
    validates :body, presence: true
    scope :custom_display, -> { order(:created_at).last(20) } #pickup latest 20 messages. can use a custom scope with any model
end