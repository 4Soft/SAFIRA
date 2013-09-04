# -*- encoding : utf-8 -*-
class HumanResourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @entrepreneurs = current_user.entrepreneurs
  end

  def create
    @entrepreneur = Entrepreneur.new(params[:entrepreneur].except(:custom_infos))
    @entrepreneur.enterprise = current_user

    params[:entrepreneur][:custom_infos].each do |info|
      @entrepreneur.custom_infos << CustomInfo.new(name: info[:name], value: info[:value])
    end if params[:entrepreneur][:custom_infos]

    if @entrepreneur.save
      redirect_to human_resources_path, notice: "Adicionado com sucesso"
    else
      flash[:notice] = "Houve um erro"
      render :index
    end
  end
end
