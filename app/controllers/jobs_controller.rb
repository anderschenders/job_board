class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
    title: params[:job][:title],
    description: params[:job][:description],
    company: params[:job][:company]
    )
    if @job.save
      #success
      redirect_to jobs_path #=>gives you back to rails request cycle to reexcute whole cycle for rails route (goes through entire cycle again)
    else
      #failure
      render :new #=>takes what data controller currently has and sends only that view (:new) and sending it back to user (goes back to view and sends that back with current data)
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

end
