class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5}
		validates :content, presence: true, length: { minimum: 10}
		validates :status, presence: true
		validates :category, presence: true
		belongs_to :category
		validates :approved, inclusion: { in: [true, false] }
		validates :approved, exclusion: { in: [nil] }
end
