class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.where(user_id: current_user.id).sort_by{|report| report.created_at}.reverse
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @incomes = Income.where(user_id: current_user.id)
    @filtered_incomes = []
    @incomes.each do |income|
      if income.date >= @report.start_date and income.date <= @report.end_date
        @filtered_incomes.push(income)
      end
    end
    @expenditures = Expenditure.where(user_id: current_user.id)
    @filtered_expenditures = []
    @expenditures.each do |expenditure|
      if expenditure.date >= @report.start_date and expenditure.date <= @report.end_date
        @filtered_expenditures.push(expenditure)
      end
    end
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:start_date, :end_date, :user_id)
    end
end
