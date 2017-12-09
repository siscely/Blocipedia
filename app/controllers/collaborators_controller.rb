class CollaboratorsController < ApplicationController
  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
    @wiki.collaborators.new(user_id: params[:user_id])
    @wiki.collaborator_for(user)
    if @wiki.collaborators.include?(user)
      flash[:notice] = "Collaborator was saved."
       redirect_to wiki_collaborator_path
    end
  end
end
