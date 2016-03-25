class ReportsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
  before_action :set_report, :only => [:show, :edit, :update, :destroy]

	def index
    @categories = Category.all
		  
    if params[:category]
      @category = Category.find(params[:category])
      @reports = @category.reports
    else
      @reports = Report.all
    end
    
      @reports = @reports.page(params[:page]).per(5).order(id: :asc)
      
	end

  def show
    @comments = @report.comments
    @comment = Comment.new
 
  end

	def new
    @report = Report.new
 	end

 	def create
    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save
    flash[:notice] = "新增成功！！"
    last_page = Report.all.count / 5
    if Report.all.count % 5 != 0
      last_page += 1
    end
    redirect_to reports_path(:page => last_page)
      else
        render :action => :new
      end 

 	end

 	def edit
 	end

 	def update
    if @report.update(report_params)
      flash[:notice] = "更新成功！！"

      redirect_to reports_path
      else
        render :action => :edit
      end
 	end

 	def destroy
      flash[:alert] = "刪除成功！"
      @report.destroy
      display_page = params[:page].to_i
      if Report.page(params[:page]).per(5).count == 0 && display_page > 1
        display_page  -= 1
      end
      redirect_to reports_path(:page => display_page) 		
 	end

private
def set_report

    @report = Report.find(params[:id])

  end

  def report_params
  	params.require(:report).permit(:title, :content, :user_id, :category_ids => [] )
  end
end
