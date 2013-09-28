class EventPresencesController < ApplicationController
  # GET /event_presences
  # GET /event_presences.json
  def index
    @event_presences = EventPresence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_presences }
    end
  end

  # GET /event_presences/1
  # GET /event_presences/1.json
  def show
    @event_presence = EventPresence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_presence }
    end
  end

  # GET /event_presences/new
  # GET /event_presences/new.json
  def new
    @event_presence = EventPresence.new
    @entrepreneurs = current_user.entrepreneurs
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_presence }
    end
  end

  # GET /event_presences/1/edit
  def edit
    @event_presence = EventPresence.find(params[:id])
    @entrepreneurs = current_user.entrepreneurs
  end

  # POST /event_presences
  # POST /event_presences.json
  def create
    @event_presence = EventPresence.new(params[:event_presence])

    respond_to do |format|
      if @event_presence.save
        format.html { redirect_to @event_presence, notice: 'Event presence was successfully created.' }
        format.json { render json: @event_presence, status: :created, location: @event_presence }
      else
        format.html { render action: "new" }
        format.json { render json: @event_presence.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /event_presences/1
  # PUT /event_presences/1.json
  def update
    @event_presence = EventPresence.find(params[:id])

    respond_to do |format|
      if @event_presence.update_attributes(params[:event_presence])
        format.html { redirect_to @event_presence, notice: 'Event presence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_presences/1
  # DELETE /event_presences/1.json
  def destroy
    @event_presence = EventPresence.find(params[:id])
    @event_presence.destroy

    respond_to do |format|
      format.html { redirect_to event_presences_url }
      format.json { head :no_content }
    end
  end
end
