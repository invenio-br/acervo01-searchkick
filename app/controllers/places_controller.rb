class PlacesController < ApplicationController
  def index
    @places = Place.search(
      search_query_param, where: { active: true }, load: false,
      fields: ["name^10", "address^5", "description"],
    )

    # @places = Place.where(active: true)
    # @places = @places.where("name LIKE ?", "%#{params.dig(:search, :q)}%") if params.dig(:search, :q).present?
    # @places = @places.order(:name)
  end

  def search
    @places = Place.search(
      params[:q], where: { active: true }, load: false,
      fields: ["name^10", "address"],
    )

    render layout: false
  end

  def show
    @place = Place.find params[:id]
  end

  private

  def search_query_param
    params.dig(:search, :q)&.presence || '*'
  end
end
