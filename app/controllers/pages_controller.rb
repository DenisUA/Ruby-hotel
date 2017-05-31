class PagesController < ApplicationController
  def about_us; end

  def help_request
    @help_request = HelpRequest.new(help_request_params)
  end

private

  def help_request_params
    params.require(:help_request).permit(:text, :user_id)
  end
end
