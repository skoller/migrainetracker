class HeadachesController < ApplicationController
  # GET /headaches
  # GET /headaches.xml
  def index
    @headaches = Headach.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @headaches }
    end
  end

  # GET /headaches/1
  # GET /headaches/1.xml
  def show
    @headach = Headach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @headach }
    end
  end

  # GET /headaches/new
  # GET /headaches/new.xml
  def new
    @headach = Headach.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @headach }
    end
  end

  # GET /headaches/1/edit
  def edit
    @headach = Headach.find(params[:id])
  end

  # POST /headaches
  # POST /headaches.xml
  def create
    @headach = Headach.new(params[:headach])

    respond_to do |format|
      if @headach.save
        flash[:notice] = 'Headach was successfully created.'
        format.html { redirect_to(@headach) }
        format.xml  { render :xml => @headach, :status => :created, :location => @headach }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @headach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /headaches/1
  # PUT /headaches/1.xml
  def update
    @headach = Headach.find(params[:id])

    respond_to do |format|
      if @headach.update_attributes(params[:headach])
        flash[:notice] = 'Headach was successfully updated.'
        format.html { redirect_to(@headach) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @headach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /headaches/1
  # DELETE /headaches/1.xml
  def destroy
    @headach = Headach.find(params[:id])
    @headach.destroy

    respond_to do |format|
      format.html { redirect_to(headaches_url) }
      format.xml  { head :ok }
    end
  end
end
