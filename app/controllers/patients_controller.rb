class PatientsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_patient, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  # GET /patients
  # GET /patients.xml
  def index
    @patients = Patient.paginate(:page => params[:page])
    @title = "All Patients"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @patient = Patient.find(params[:id])
    @title = "My Profile"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new
    @title = "Sign up"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    @title = "Edit"
  end

  # POST /patients
  # POST /patients.xml
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        sign_in @patient
        flash[:notice] = 'You have successfully signed up!'
        format.html { redirect_to @patient }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:notice] = 'Your profile was successfully updated.'
        format.html { redirect_to(@patient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      flash[:success] = "Patient Permanently Removed"
      format.html { redirect_to(patients_path) }
      format.xml  { head :ok }
    end
  end

#--------------------------------------------
private

  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_patient
    @patient = Patient.find(params[:id])
    redirect_to(root_path) unless current_patient?(@patient)
  end
  
  def admin_user
    redirect_to(root_path) unless current_patient.admin?
  end
end
