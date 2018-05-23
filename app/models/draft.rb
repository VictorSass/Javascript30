class Draft < ApplicationRecord
  default_scope { order('id ASC') }
end
