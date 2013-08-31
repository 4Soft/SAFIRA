# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

	def dashboard
		redirect_to selection_processes_path
	end
end
