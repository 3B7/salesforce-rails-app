class ReleaseNotesController < ApplicationController
  helper_method :current_user

  before_filter :require_authorized_user
  before_filter :require_authorized_salesforce_user
  before_filter :require_admin_user, :except => [:new, :create]
  
  def index
    @notes = ReleaseNotes.order('id DESC')
  end

  def new
    @note = ReleaseNotes.new
    @last_note = ReleaseNotes.last
  end

  def create
    @note = ReleaseNotes.create!(params[:release_notes])

    if @note.save
      redirect_to release_notes_url, notice: "Note was saved successfully."
    else
      flash[:error] = "Error creating note. Please try again."
      render :new
    end
  end

end