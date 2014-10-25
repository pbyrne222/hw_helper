class NotesController < ApplicationController
	before_action :authenticate_user!

	def create
		@problem = Problem.find(params[:problem_id])
		@note = @problem.notes.build(answer_params)
		@note.user = current_user

		if @note.save
			redirect_to @problem
		else
			render "problems/show"
		end
	end

	private

	def answer_params
		params.require(:note).permit(:text)
	end

end
