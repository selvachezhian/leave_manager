class LeaveController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]

  # GET /leave
  # GET /leave.json
  def index
    @leaves = Leave.all
  end

  # GET /leave/1
  # GET /leave/1.json
  def show
  end

  # GET /leave/new
  def new
    @leave = Leave.new
  end

  # GET /leave/1/edit
  def edit
  end

  # POST /leave
  # POST /leave.json
  def add_leave
    @leave = Leave.new(leave_params)

    respond_to do |format|
      if @leave.save
        format.html { redirect_to @leave, notice: 'Leafe was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave/1
  # PATCH/PUT /leave/1.json
  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to @leave, notice: 'Leafe was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave }
      else
        format.html { render :edit }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave/1
  # DELETE /leave/1.json
  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_leave
    @leaves = Leave.between(Date.parse(params[:start]), Date.parse(params[:end]))
    respond_to do |format|
      format.json { render :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave
      @leave = Leave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_params
      params.require(:leave).permit(:notes, :start_date, :end_date)
    end
end
