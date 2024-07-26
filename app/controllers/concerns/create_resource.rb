# frozen_string_literal: true

module CreateResource
  extend ActiveSupport::Concern
  included do
    def create_resource(resource)
      resource.save
      respond_with(resource, location: root_path)
    end
  end
end
