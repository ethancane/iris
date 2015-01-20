require 'rails_helper'

RSpec.describe Reporting::Downloading::GetEventLogMarker do
  let(:marker) do
    '3aec2e2f-flydata/app29267468_system/year=2014/month=09/' \
    'day=08/20140908-18.gz'
  end

  before do
    $redis_pool.with do |redis|
      redis.set(Reporting::Downloading::SetEventLogMarker::REDIS_KEY, marker)
    end
  end

  it 'persists the log marker forever' do
    expect(described_class.call).to eq marker
  end
end