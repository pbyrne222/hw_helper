class NotesController < ApplicationController
	before_action :authenticate_user!

	def create
		@problem = Problem.find(params[:problem_id])
		@note = @problem.notes.build(note_params)
		@note.user = current_user

		if @note.save
			redirect_to problem_path(@problem)
		else
			render "problems/show", alert: "Your note did not save."
		end
	end

	private

	def note_params
		params.require(:note).permit(:text)
	end

end
