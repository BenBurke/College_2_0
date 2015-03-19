class MessagesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy


  def create
  	@message = current_user.messages.build(message_params)
  	if @message.save
      @user = User.find(@message.recipient_id)
  		flash[:success] = "Message Delivered!"
  		redirect_to @user
  	else
  		@mail_box_messages = []
  		render 'static_pages/home'
  	end
  end

  def destroy
  	@message.destroy
  	flash[:success] = "Message Deleted!"
  	redirect_to request.referrer || root_url
  end

  private

  	def message_params
      params.require(:message).permit(:content, :picture, :recipient_id
    end

    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_url if @message.nil?
    end
end
