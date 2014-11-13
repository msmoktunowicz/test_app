class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.find_by_sql("SELECT * FROM posts")
  @posts = Post.all  
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end
  
  def publish
     @post = Post.find(params[:id])
     @post.update_attribute(:visible, true)
     redirect_to :back
  end


    # @recipe = Recipe.new(recipe_params)
    #   if @recipe.save
    #     redirect_to @recipe
    #   else
    #     render :new 
    #   end
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id

    # respond_to do |format|
      if @post.save
          redirect_to posts_path
        # format.html { redirect_to @post, notice: 'Post was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @post }
      else
        render :new
        # format.html { render action: 'new' }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end 



    # respond_to do |format|
    #   if @post.update(post_params)
    #     @post.update_attribute(:user_id, current_user.id)
    #     format.html { redirect_to @post, notice: 'Post was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.delete
    redirect_to posts_path
    # respond_to do |format|
    #   format.html { redirect_to posts_url }
    #   format.json { head :no_content }
    end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :post_id)
    end
end
