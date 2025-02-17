class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts#index"
    else
      render :new, :unprocessable_content
    end
  end

  private

  def post_params
    params.expect(post: [ :user_id, :title, :body ])
  end
end
