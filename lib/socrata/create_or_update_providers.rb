require_relative './simple_soda_client'

module Socrata
  # We need to import CMS provider data from Socrata. This is the core wrapper
  # for the involved components.
  module CreateOrUpdateProviders
    DATASET_ID = 'xubh-q36u'
    REQUIRED_COLUMNS = %w[
      provider_id
      hospital_name
      hospital_type
      city
      state
      zip_code
    ]

    def self.call
      providers = SimpleSodaClient.new(
        dataset_id: DATASET_ID,
        required_columns: REQUIRED_COLUMNS,
      )
      providers.each_with_index do |provider_attributes, index|
        provider_attributes['name'] = provider_attributes
                                      .delete('hospital_name')
        Hospital.create_or_update(provider_attributes)
        yield index
      end
        .length
    end
  end
end
