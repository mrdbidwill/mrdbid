class GillAttachmentsController < ApplicationController
  before_action :set_gill_attachment, only: %i[ show edit update destroy ]

  # GET /gill_attachments or /gill_attachments.json
  def index
    @gill_attachments = GillAttachment.all
  end

  # GET /gill_attachments/1 or /gill_attachments/1.json
  def show
  end

  # GET /gill_attachments/new
  def new
    @gill_attachment = GillAttachment.new
  end

  # GET /gill_attachments/1/edit
  def edit
  end

  # POST /gill_attachments or /gill_attachments.json
  def create
    @gill_attachment = GillAttachment.new(gill_attachment_params)

    respond_to do |format|
      if @gill_attachment.save
        format.html { redirect_to @gill_attachment, notice: "Gill attachment was successfully created." }
        format.json { render :show, status: :created, location: @gill_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_attachments/1 or /gill_attachments/1.json
  def update
    respond_to do |format|
      if @gill_attachment.update(gill_attachment_params)
        format.html { redirect_to @gill_attachment, notice: "Gill attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_attachments/1 or /gill_attachments/1.json
  def destroy
    @gill_attachment.destroy!

    respond_to do |format|
      format.html { redirect_to gill_attachments_path, status: :see_other, notice: "Gill attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_attachment
      @gill_attachment = GillAttachment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_attachment_params
      params.expect(gill_attachment: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
