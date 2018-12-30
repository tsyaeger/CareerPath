# frozen_string_literal: true

module DocumentsHelper
  def groupDoctype(documents)
    documents.group_by(&:doctype)
  end
end
