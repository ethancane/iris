# Controller for autocomplete measures search
class MeasureSearchResultsController < ApplicationController
  def index
    ms = PUBLIC_CHARTS_TREE.find_node('public-data', providers: provider_subset)
    term = params.fetch(:term)
    results = ms.search(term)
    render partial: 'bundle',
           collection: results.children,
           locals: { term: term }
  end

  private

  def provider_subset
    Hospital.first(5)
  end
end