class PagesController < ApplicationController

  def home
    if params[:r] == "true"
      Article.destroy_all
    end
  end

end
