class CommentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @product, notice: 'Review was created successfully.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render 'products/show', alert: 'Review was not successfully.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :description, :image_url, :colour, :rating, :body)
    end


end
