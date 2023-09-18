class ExtractionsController < ApplicationController
  before_action :set_extraction, only: %i[edit update show]
  include Prozable

  def index
    @extractions = Extraction.all
  end

  def new
    @extraction = Extraction.new
  end

  def edit; end
  def show; end

  def create
    begin
      @extraction = Extraction.new(extraction_params)
      prepare_extraction
    rescue StandardError
      flash.now[:alert] = 'Link looks incorrect'
    end

    respond_to do |format|
      if @extraction.save

        format.html { redirect_to edit_extraction_path(@extraction), notice: 'created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @extraction.update(extraction_params)
        format.html { redirect_to extraction_url(@extraction), notice: 'Extraction was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_extraction
    @extraction = Extraction.find(params[:id])
  end

  def extraction_params
    params.fetch(:extraction, {}).permit(:first_name, :last_name, :country, :native_lang, :target_lang, :source)
  end

  def prepare_extraction
    @extraction.native_lang = source_values.first
    @extraction.country = source_values.second.join('')
    @extraction.target_lang = source_values.third
    @extraction.first_name = source_values.last[0]
    @extraction.last_name = source_values.last[1..].join(', ')
  end
end
