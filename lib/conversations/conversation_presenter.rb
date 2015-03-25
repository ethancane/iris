require './app/models/conversation'

# .
module Conversations
  # Setup new conversation form as well as load existing conversations for a
  # chart.
  ConversationPresenter = Struct.new(:user, :node) do
    def new_conversation
      Conversation.new
    end

    def chart_conversations
      Conversation.for_chart(
        user.selected_provider,
        node.id_component,
        user,
      )
    end
  end
end
