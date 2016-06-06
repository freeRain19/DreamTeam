class PostsController < ApplicationController
  before_action :set_post, only: [ :edit, :update, :destroy]
  before_action :set_task, only: [:new, :create]
  load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    if params[:task_id].present?
      @task = Task.find(params[:task_id])
      @posts=@task.posts
    else
      @posts = Post.all
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post=Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.task_id=@task.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to task_url(@post.task_id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to task_url(@post.task_id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to task_url(@post.task_id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content)
  end
end
