class BlogconfigsController < ApplicationController
  http_basic_authenticate_with(name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']) if Rails.env.production?
  layout 'blogconfigs'

  def index
    @blogconfig = Blogconfig.find(1)
  end

  def edit
    @blogconfig = Blogconfig.find(1)

    if request.patch? && @blogconfig.update(blogconfig_params)
      redirect_to '/blogconfigs'
    end
  end

  private

  def blogconfig_params
    params.require(:blogconfig).permit(:title, :subtitle, :stylename)
  end
end
