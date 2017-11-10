class BloggenresController < ApplicationController
  http_basic_authenticate_with(name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']) if Rails.env.production?
  layout 'bloggenres'

  def index
    @data = Bloggenre.all
  end

  def add
    @bloggenre = Bloggenre.new

    if request.post?
      @bloggenre = Bloggenre.new(bloggenre_params)
      if @bloggenre.save
        redirect_to '/bloggenres'
      end
    end
  end

  def edit
    @bloggenre = Bloggenre.find(params[:id])

    if request.patch? && @bloggenre.update(bloggenre_params)
      redirect_to '/bloggenres'
    end
  end

  private

  def bloggenre_params
    params.require(:bloggenre).permit(:name, :memo)
  end
end
