# frozen_string_literal: true

module ContactsHelper
  def formatted_name(contact)
    "#{contact.first_name} #{contact.last_name}".titlecase
  end
end
