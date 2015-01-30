module Socrata
  # We need to import CMS hospital data from Socrata. This is the core wrapper
  # for the involved components.
  module CreateOrUpdateHospitals
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
      hospitals = ResultIterator.new(
        dataset_id: DATASET_ID,
        required_columns: REQUIRED_COLUMNS,
      )
      hospitals.each do |hospital_attributes|
        Hospital.create_or_update(hospital_attributes)
        yield
      end
      hospitals.length
    end
  end
end
