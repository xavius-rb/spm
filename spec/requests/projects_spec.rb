require 'rails_helper'

RSpec.describe "/projects", type: :request do
  let(:valid_attributes) { attributes_for(:project) }
  let(:invalid_attributes) { attributes_for(:project, name: "") }
  it_behaves_like :resource_controller, Project
end
