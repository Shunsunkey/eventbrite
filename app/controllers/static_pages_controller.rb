class StaticPagesController < ApplicationController
  def team
  end
  def contact
  end
  def welcome
    @user = current_user
  end
  def index
    @events = Event.all
    @users = User.all
    @users_with_events = User.includes(:events).where.not(events: { id: nil }).distinct
  end
end
