class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show,:index]
  before_action :right_user, only:[:edit,:update,:destroy]
  # GET /posts or /posts.json

  def like
    @post = Post.all.find(params[:id])
    temp = @post.upvotes+1
    if @post.isdisliked(current_user)
      temp2 = @post.downvotes - 1
      @post.update(upvotes: temp, downvotes: temp2)
      Dislike.find_or_create_by(user_id: current_user.id).destroy
    else
      @post.update(upvotes: temp)
    end
    Like.create(user_id: current_user.id, post_id: @post.id)

    redirect_back(fallback_location: home_whatshot_path)

    #respond_to do |format|
      #format.js {render inline: "location.reload();" }
      #format.html{ redirect_to home_whatshot_path }
    #end
    
  end

  def dislike
    @post = Post.all.find(params[:id])
    temp=@post.downvotes+1
    if @post.isliked(current_user)
      temp2 = @post.upvotes - 1
      @post.update(upvotes:temp2,downvotes:temp)
      Like.find_or_create_by(user_id:current_user.id,post_id:@post.id).destroy
    else
      @post.update(downvotes: temp)
    end

    Dislike.create(user_id:current_user.id, post_id:@post.id)

    redirect_back(fallback_location: home_whatshot_path)
  end


  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  def right_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "Not authorized." if @post.nil?
  end
  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :upvotes, :downvotes, :updatedat, :userid)
    end
end