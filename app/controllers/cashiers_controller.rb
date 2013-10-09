class CashiersController < ApplicationController
  # GET /cashiers
  # GET /cashiers.json
  def index
    @cashiers = Cashier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cashiers }
    end
  end

  # GET /cashiers/1
  # GET /cashiers/1.json
  def show
    @cashier = Cashier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cashier }
    end
  end

  # GET /cashiers/new
  # GET /cashiers/new.json
  def new
    @cashier = Cashier.new
    @cashier.opening_balance ||= 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cashier }
    end
  end

  # GET /cashiers/1/edit
  def edit
    @cashier = Cashier.find(params[:id])
  end

  # POST /cashiers
  # POST /cashiers.json
  def create
    @cashier = Cashier.new(params[:cashier])
    

    respond_to do |format|
      if @cashier.save
        format.html { redirect_to @cashier, notice: 'Cashier was successfully created.' }
        format.json { render json: @cashier, status: :created, location: @cashier }
      else
        format.html { render action: "new" }
        format.json { render json: @cashier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cashiers/1
  # PUT /cashiers/1.json
  def update
    @cashier = Cashier.find(params[:id])

    respond_to do |format|
      if @cashier.update_attributes(params[:cashier])
        format.html { redirect_to @cashier, notice: 'Cashier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cashier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashiers/1
  # DELETE /cashiers/1.json
  def destroy
    @cashier = Cashier.find(params[:id])
    @releases = @cashier.releases
    @releases.destroy_all
    @cashier.destroy

    respond_to do |format|
      format.html { redirect_to cashiers_url }
      format.json { head :no_content }
    end
  end

  def changeOpeningBalance (value)
    @cashier = Cashier.find(params[:id])
    

    respond_to do |format|
      if @cashier.opening_balance += value
        format.html { redirect_to @cashier, notice: 'Cashier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cashier.errors, status: :unprocessable_entity }
      end
    end
  end
end
