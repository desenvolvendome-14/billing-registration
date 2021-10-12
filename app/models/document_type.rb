# frozen_string_literal: true

class DocumentType < ApplicationRecord
  validates :description, presence: true
end
