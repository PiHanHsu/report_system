class ReportCommentsController < ApplicationController
before_action :set_report, :only => [:show, :create, :edit, :update, :destroy]

    def show
    end

	def new
 	   @comment = @report.build_comment
 	end

 	def create	
 		@comment = @report.comments.build(comment_params)
  		@comment.user = current_user

  		@comment.save
  		flash[:notice] = "新增成功！！"
  		redirect_to report_path(@report)
 	end

 	def edit
 	end

 	def update
	    if @comment.update(comment_params)
    	  flash[:notice] = "更新成功！！"
          redirect_to reports_path
      	else
          render :action => :edit
    	end
 	end

 	def destroy
      flash[:alert] = "刪除成功！"
      @comment = @report.comments.find(params[:id])
      @comment.destroy
      
      redirect_to report_path(@report)		
 	end

private
def set_report

    @report = Report.find(params[:report_id])

end

def comment_params
  	params.require(:comment).permit(:content, :user_id, :report_id)
end

end
