class SchedulesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
        Schedule,
        params[:filterrific],
        select_options: {
          with_mountain_id: Mountain.options_for_select
        },
        persistence_id: "shared_key",
        default_filter_params: {},
        #available_filters: [:with_mountain_id, :with_schedule_date],
        sanitize_params: true,
      ) || return
      # Get an ActiveRecord::Relation for all students that match the filter settings.
      # You can paginate with will_paginate or kaminari.
      # NOTE: filterrific_find returns an ActiveRecord Relation that can be
      # chained with other scopes to further narrow down the scope of the list,
      # e.g., to apply permissions or to hard coded exclude certain types of records.
      @schedules = @filterrific.find.page(params[:page])
  
      # Respond to html for initial page load and to js for AJAX filter updates.
      respond_to do |format|
        format.html
        format.js
      end
  
    # Recover from invalid param sets, e.g., when a filter refers to the
    # database id of a record that doesn’t exist any more.
    # In this case we reset filterrific and discard all filter params.
    rescue ActiveRecord::RecordNotFound => e
        # There is an issue with the persisted param_set. Reset it.
        puts "Had to reset filterrific params: #{e.message}"
        redirect_to(reset_filterrific_url(format: :html)) && return
  end
  
  def index2
    #@schedules = Schedule.where(available_schedule: true).order(:schedule_date)
  end
  
  def create
  end

  def show
    @schedule = Schedule.find(params[:id])
    @available_slot = @schedule.schedule_max_participants - @schedule.schedule_current_participants
  end

  def update
  end

  def destroy
  end
end
