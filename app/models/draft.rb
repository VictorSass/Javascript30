class Draft < ApplicationRecord
  default_scope { order("id ASC") }
  scope :next, lambda {|id| where("id > ?", id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?", id).order("id DESC") }

  def next
    Draft.next(self.id).first
  end

  def previous
    Draft.previous(self.id).last
  end
end
