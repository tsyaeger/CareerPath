# frozen_string_literal: true

module JobsHelper
  def truncate_desc(desc)
    truncate_desc(desc, length: 10, omission: '...')
  end
end
