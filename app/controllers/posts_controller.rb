class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /posts
  def index
    @posts = Post.recent
    # raise method(:render).source_location.inspect
    respond_with @posts
  end

  # GET /posts/1
  def show
    respond_with @post
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_with @post
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.created_by_ip = request.remote_ip

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
