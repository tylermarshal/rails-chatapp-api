require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  describe 'perform' do
    let(:message) { FactoryBot.create(:message) }

    it 'queues a job' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        MessageBroadcastJob.perform_later(message)
      }.to have_enqueued_job.with(message)
    end
  end
end
