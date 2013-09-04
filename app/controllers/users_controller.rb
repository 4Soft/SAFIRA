# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!

	def dashboard
		redirect_to selection_processes_path
	end
end
