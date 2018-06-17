class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  include MessagesHelper

  # GET /messages
  # GET /messages.json
  def index
    @messages = current_user.messages.page(params[:page]).per(10)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.includes(:records).where(id: params[:id]).first
  end

  # GET /messages/new
  def new
    @message = Message.new
    @message.record_ids = params[:record_ids]
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user = current_user

    mail = create_mail @message

    respond_to do |format|
      if @message.save
        response = deliver mail
        logger.error(response.status_code) unless /^2\d\d$/.match? response.status_code
        format.html { redirect_to @message, notice: 'Message was successfully created and sent.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:subject, :body, record_ids: [])
    end
end
