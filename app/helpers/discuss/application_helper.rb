module Discuss
  module ApplicationHelper
    # [e] for lack of a better name
    # also happy to rethink this method
    def message_person(mailbox_name, message)
      case mailbox_name
      when 'inbox'  then message.sender.user
      when 'outbox' then recipients_string(message.recipient_list)
      when 'drafts' then message.draft_recipient_ids ? recipients_string(message.recipient_list) : 'Draft'
      when 'trash'  then message.sent? ? recipients_string(message.recipient_list) : message.sender.user
      else
        message.user
      end
    end

    def recipients_string(users)
      users.join(', ')
    end
  end
end
