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

  def update
    #update database
    @job = Job.find(params[:id])
    result = @job.update({
      title: params[:job][:title],
      description: params[:job][:description],
      company: params[:job][:company]
      })

    if result
      #if successful go back to show view
      redirect_to job_path(@job.id) #(params[:id])
      # get /jobs/:id (handled by the router, then goes to controller action, which is show action, runs all code in show action (just like if it was coming from the broswer), then goes to rails model, finds data, pulls in the view for the show view and sends that back to the broswer)
    else
      #if unsuccessful stay on the form
      #does not go to the router or controller and therefore no additional model operations
      #goes directly from the controller we're in, to pull that view pass in whatever data we curently have at the moment (@job) and send that view back as the response
      #does not execute whole rails request cycle and pull in any additional data
      render :edit
    end

  end

  def delete
    #remove this job from database
    job = Job.find(params[:id]) #only need instance variables when accessed in a view external to the controller (ask yourself, do I need this variable in a view?)
    if job.destroy
    #if successful go back to index page
    redirect_to jobs_path
    else
    #if unsuccessful show an error

    end
  end

end
