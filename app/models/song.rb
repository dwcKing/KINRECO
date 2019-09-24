class Song < ApplicationRecord
	belongs_to :disc
	validates :song_title, presence: true
	validates :song_order, presence: true
end
