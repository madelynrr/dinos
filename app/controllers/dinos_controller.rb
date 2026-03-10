class DinosController < ApplicationController
  before_action :set_dino, only: %i[ show edit update destroy ]

  # GET /dinos or /dinos.json
  def index
    @dinos = Dino.all

    # Any more than two instance variables, and I would set up a presenter for this controller.
    @summary = Dino.create_summary
  end

  # GET /dinos/1 or /dinos/1.json
  def show
  end

  # GET /dinos/new
  def new
    @dino = Dino.new
  end

  # GET /dinos/1/edit
  def edit
  end

  # POST /dinos or /dinos.json
  def create
    @dino = Dino.new(dino_params)

    respond_to do |format|
      if @dino.save
        format.html { redirect_to @dino, notice: "Dino was successfully created." }
        format.json { render :show, status: :created, location: @dino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinos/1 or /dinos/1.json
  def update
    respond_to do |format|
      if @dino.update(dino_params)
        format.html { redirect_to @dino, notice: "Dino was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @dino }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinos/1 or /dinos/1.json
  def destroy
    @dino.destroy!

    respond_to do |format|
      format.html { redirect_to dinos_path, notice: "Dino was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dino
      @dino = Dino.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dino_params
      params.expect(dino: [ :name, :category, :period, :diet, :age ])
    end
end
