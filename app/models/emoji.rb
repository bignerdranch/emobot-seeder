class Emoji < ApplicationRecord
  self.table_name = 'emoji'
  belongs_to :value
end
