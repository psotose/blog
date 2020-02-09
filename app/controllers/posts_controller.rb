class PostsController < ApplicationController
  
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: [:dashboard, :create ]
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  
  def index
    @posts = Post.all.order(created_at: :desc)
    
  end

  def dashboard 
    @post = Post.new
  end

  def save
    post_data = post_params
    post_data[:content] = post_data[:content].remove("de")

    @post = Post.new(post_data)
    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to created_post_path  
    else
      flash[:notice] = "Post was not created"
      redirect_to posts_dashboard_path(@post)     
    end    
  end

  def create
    @posts = Post.all.order(created_at: :desc)
  end

  def edit   
  end  

  def update
    post_data = post_params
    post_data[:content] = post_data[:content].remove("de")

    if @post.update(post_data)
        flash[:notice] = "Post was successfully updated"
        redirect_to created_post_path(@post)
    else
        redirect_to edit_post_path(@post)
        flash[:notice] = "Post was not updated"
    end       
  end   

  def show  
  end    

  def destroy 
    @post.destroy
    flash[:notice] = "Post was successfully deleted"
    redirect_to created_post_path
  end

  private
    def set_post
      @post = Post.find(params[:id]) 
    end
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end      

end
