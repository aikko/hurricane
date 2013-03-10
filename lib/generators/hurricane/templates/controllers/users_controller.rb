# coding : utf-8
class <%= plural_name.humanize %>Controller < LoginRequiredController
  load_and_authorize_resource

  # GET /<%=plural_name%>
  # GET /<%=plural_name%>.json
  def index
    @<%=plural_name%> = <%= human_name%>.page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @<%=plural_name%>}
    end
  end
  
  # GET /<%=plural_name%>/1
  # GET /<%=plural_name%>/1.json
  def show
    @<%=singular_name%> = <%=human_name%>.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @<%=singular_name%> }
    end
  end

  # GET /<%=plural_name%>/new
  # GET /<%=plural_name%>/new.json
  def new
    @<%=singular_name%> = <%=human_name%>.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @<%=singular_name%> }
    end
  end


  # GET /<%=plural_name%>/1/edit
  def edit
    @<%=singular_name%> = <%=human_name%>.find(params[:id])
  end

  # POST /<%=plural_name%>
  # POST /<%=plural_name%>.json
  def create
    @<%=singular_name%> = <%=human_name%>.new(params[:<%=singular_name%>])

    respond_to do |format|
      if @<%=singular_name%>.save
        format.html { redirect_to edit_<%=singular_name%>_path(@<%=singular_name%>), :notice => t 'hurricane.notice.create_record_success', :type => t_type
        format.json { render json: @<%=singular_name%>, status: :created, location: @<%=singular_name%> }
      else
        format.html { render action: "new" }
        format.json { render json: @<%=singular_name%>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plural_name/1
  # PUT /plural_name/1.json
  def update
    @<%=singular_name%> = <%=human_name%>.find(params[:id])

    respond_to do |format|
      if @<%=singular_name%>.update_attributes(params[:<%=singular_name%>])
        format.html { redirect_to edit_<%=singular_name%>_path(@<%=singular_name%>), :notice => t 'hurricane.notice.modify_record_success', :type => t_type
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @<%=singular_name%>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /<%=plural_name%>/1
  # DELETE /<%=plural_name%>/1.json
  def destroy
    @<%=singular_name%> = <%=singular_name%>.find(params[:id])
    @<%=singular_name%>.destroy

    respond_to do |format|
      format.html { redirect_to <%=plural_name%>_url, :notice => t 'hurricane.notice.delete_record_success', :type=> t_type
      format.json { head :no_content }
    end
  end

  # DELETE /<%=plural_name%>/delete/all
  def destroy_all
    if params[:<%=plural_name%>]
      <%=singular_name%>.destroy_all(:id => params[:<%=plural_name%>])
      redirect_to <%=plural_name%>_url, :notice => t 'hurricane.notice.delete_records_success', :type => t_type
    else
      redirect_to <%=plural_name%>_url, :alert => t 'hurricane.alert.choose_delete_records', :type => t_type
    end
  end

  private
  def record_type
    :type_<%=singular_name%>
  end
end
