module Admin
  class EntriesController < AdminController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    before_action :must_self_entry!, only: [:edit, :update]
    layout  'admin'

    # GET /entries
    # GET /entries.json
    def index
      @begin_time = Date.parse(params[:date]).beginning_of_month rescue Date.today.beginning_of_month
      end_time = @begin_time.end_of_month
      @results = Entry.where('real_time >= ? AND real_time <= ?' , @begin_time, end_time).group(:user_id).sum(:price)
      @entries = Entry.includes(:user, :cost_type).order('real_time DESC').page(params[:page]).per(30)
    end

    # GET /entries/1
    # GET /entries/1.json
    def show
    end

    # GET /entries/new
    def new
      @entry = Entry.new
    end

    # GET /entries/1/edit
    def edit
      @entry = Entry.includes(:cost_type, :user).find(params[:id])
      puts @entry.inspect
      puts @entry.price
    end

    # POST /entries
    # POST /entries.json
    def create
      @entry = Entry.new(entry_params)
      @entry.user_id = current_user.id

      respond_to do |format|
        if @entry.save
          format.html { redirect_to [:admin, @entry], notice: '记账成功。' }
          format.json { render :show, status: :created, location: @entry }
        else
          format.html { render :new }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /entries/1
    # PATCH/PUT /entries/1.json
    def update
      respond_to do |format|
        if @entry.update(entry_params)
          format.html { redirect_to @entry, notice: '更新成功。.' }
          format.json { render :show, status: :ok, location: @entry }
        else
          format.html { render :edit }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /entries/1
    # DELETE /entries/1.json
    def destroy
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:user_id, :real_time, :desc, :cost_type_id, :price)
    end
  end
end
