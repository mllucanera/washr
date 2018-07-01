class WelcomesController < ApplicationController

def welcome
end

def registration
  @user = current_user
end

def confirmation

end

end
