# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :items

  # has_many :items
  # side-loading child record ids
  def items
    object.items.pluck(:id)
  end
end
