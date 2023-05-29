class AiRequestJob < ApplicationJob
  queue_as :default

  def perform(ai_request_params, api_key)
    # Do something later
    uuid = ai_request_params[:uuid]
    generated_idea = ai_request_params[:prompt]

    Turbo::StreamsChannel.broadcast_update_to("channel_#{uuid}", 
      target: 'ai_output',
      partial: 'ai/output'
      locals: { generated_idea: })
  end
end
