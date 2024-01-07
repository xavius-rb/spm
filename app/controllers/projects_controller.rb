class ProjectsController < ApplicationController
  include Xavius::Controllers::Base

  private
    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :code, :details)
    end

    alias_method :resource_params, :project_params
end
