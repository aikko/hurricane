# coding = utf-8
class RolesController < LoginRequiredController
  load_and_authorize_resource

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles}
    end
  end
  
  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end


  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to edit_role_path(@role), :notice => t('hurricane.notice.create_record_success', :type => t_type) }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to edit_role_path(@role), :notice => t('hurricane.notice.update_record_success', :type => t_type)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url , :notice => t('hurricane.notice.delete_record_success', :type => t_type)}
      format.json { head :no_content }
    end
  end

  # DELETE /roles/delete/all
  def destroy_all
    p params
    unless params[:roles]
      redirect_to roles_url, :alert => t('hurricane.alert.choose_delete_records', :type => t_type)
    else
      Role.delete_all(:id => params[:roles])
      redirect_to roles_url, :notice => t('hurricane.notice.delete_records_success', :type => t_type)
    end
  end

  def record_type
    :role
  end
end
