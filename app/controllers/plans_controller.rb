class PlansController < ApplicationController
  require 'eventful/api'
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]


  def index # I include the comments that belog to the each plan
      @plans = Plan.all.includes(:comments).paginate(:page => params[:page], :per_page => 5)
        if params[:location] != nil
        location = params[:location] #get the search input from the user
        keyword = params[:keyword]
        eventful = Eventful::API.new ENV['EVENTFUL_KEY'] #send the request to the API
        @results = eventful.call 'events/search',        #store the response
                               :keywords => keyword,
                               :location => location,
                               :page_size => 5

  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to prevent reapetation.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow the parameters that we want.
    def plan_params
      params.require(:plan).permit(:contant)
    end
end
