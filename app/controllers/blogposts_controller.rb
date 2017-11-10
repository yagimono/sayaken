class BlogpostsController < ApplicationController
  http_basic_authenticate_with(name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']) if Rails.env.production?
  layout 'blogposts'

  def index
    @data = Blogpost.all.order('created_at desc')
  end

  def add
    @blogpost = Blogpost.new
    @genres   = Bloggenre.all

    if request.post?
      @blogpost = Blogpost.new(blogposts_params)
      if @blogpost.save
        redirect_to '/blogposts'
      end
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
    @genres   = Bloggenre.all

    if request.patch? && @blogpost.update(blogposts_params)
      redirect_to '/blogposts'
    end
  end

  def delete
    @blogpost = Blogpost.find(params[:id])

    if request.post?
      @blogpost.destroy
      redirect_to '/blogposts'
    end
  end

  private

  def blogposts_params
    params.require(:blogpost).permit(:title, :read, :content, :bloggenre_id)
  end
end
