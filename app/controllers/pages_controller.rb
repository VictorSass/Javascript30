class PagesController < ApplicationController
  def home
    @drafts = Draft.all
  end
end
