require 'reporting/daily_page_view_metrics_report'
require './spec/support/fixture_data/log_data'

RSpec.describe Reporting::DailyPageViewMetricsReport do
  let(:report) { described_class.call(log_lines) }
  let(:log_lines) do
    [
      learn_view_data,
      learn_view_data,
      untracked_data,
      activity_view_data,
    ]
  end
  let(:learn_route) { 'metric_samples/:metric_sample/learn' }
  let(:activities_route) { 'news/activity_filters/:activity_filter/activities' }
  let(:learn_view_data) { LogData.page_view(learn_route) }
  let(:activity_view_data) { LogData.page_view(activities_route) }
  let(:untracked_data) { LogData.dummy_event(learn_route) }

  it 'returns the routes hit today and their counts' do
    expect(report).to eq(
      learn_route => 2,
      activities_route => 1,
    )
  end
end
