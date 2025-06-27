class TreeAssociationsController < ApplicationController
  before_action :set_tree_association, only: %i[ show edit update destroy ]

  # GET /tree_associations or /tree_associations.json
  def index
    @tree_associations = TreeAssociation.all
  end

  # GET /tree_associations/1 or /tree_associations/1.json
  def show
  end

  # GET /tree_associations/new
  def new
    @tree_association = TreeAssociation.new
  end

  # GET /tree_associations/1/edit
  def edit
  end

  # POST /tree_associations or /tree_associations.json
  def create
    @tree_association = TreeAssociation.new(tree_association_params)

    respond_to do |format|
      if @tree_association.save
        format.html { redirect_to @tree_association, notice: "Tree association was successfully created." }
        format.json { render :show, status: :created, location: @tree_association }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tree_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tree_associations/1 or /tree_associations/1.json
  def update
    respond_to do |format|
      if @tree_association.update(tree_association_params)
        format.html { redirect_to @tree_association, notice: "Tree association was successfully updated." }
        format.json { render :show, status: :ok, location: @tree_association }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tree_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tree_associations/1 or /tree_associations/1.json
  def destroy
    @tree_association.destroy!

    respond_to do |format|
      format.html { redirect_to tree_associations_path, status: :see_other, notice: "Tree association was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree_association
      @tree_association = TreeAssociation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tree_association_params
      params.expect(tree_association: [ :mushroom_id, :tree_id ])
    end
end
