class HomeController < ApplicationController
  def top
    if logged_in?
       redirect_to user_path(id: current_user.id)
     end
   end
end
