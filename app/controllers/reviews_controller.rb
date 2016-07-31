class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: :destroy
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    @product = @review.product
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      flash[:success] = "Review has been added."
      redirect_to products_path
    else
      flash[:danger] = "Review could not be added."
      render 'static_pages/home'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:success] = "Review has been updated"
      redirect_to @review.product
    else
      redirect_to root_url
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    flash[:success] = "Post has been deleted."
    redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :rating, :product_id)
    end

    def correct_user
     @review = current_user.reviews.find_by(id: params[:id])
     redirect_to root_url if @review.nil?
    end

end
