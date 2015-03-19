class StaticPagesController < ApplicationController
  def home
  	@message = current_user.messages.build if logged_in?
  	@mail_box_messages = current_user.mail_box.paginate(page: params[:page]) if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
