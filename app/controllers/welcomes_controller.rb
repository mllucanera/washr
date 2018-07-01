class WelcomesController < ApplicationController

def welcome
end

def registration
  @user = current_user
end

end
