class PresencesController < ApplicationController
  # GET /presences
  # GET /presences.json
  def index
    @presences = Presence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presences }
    end
  end

  # GET /presences/1
  # GET /presences/1.json
  def show
    @presence = Presence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presence }
    end
  end

  # GET /presences/new
  # GET /presences/new.json
  def new
    @presence = Presence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presence }
    end
  end

  # GET /presences/1/edit
  def edit
    @presence = Presence.find(params[:id])
  end

  # POST /presences
  # POST /presences.json
  def create
    @presence = Presence.new(params[:presence])

    respond_to do |format|
      if @presence.save
        format.html { redirect_to @presence, notice: 'Presence was successfully created.' }
        format.json { render json: @presence, status: :created, location: @presence }
      else
        format.html { render action: "new" }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presences/1
  # PUT /presences/1.json
  def update
    @presence = Presence.find(params[:id])

    respond_to do |format|
      if @presence.update_attributes(params[:presence])
        format.html { redirect_to @presence, notice: 'Presence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presences/1
  # DELETE /presences/1.json
  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy

    respond_to do |format|
      format.html { redirect_to presences_url }
      format.json { head :no_content }
    end
  end
end
