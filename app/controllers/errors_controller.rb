class ErrorsController < ApplicationController
  def not_found
    @business_types = BusinessType.all
    render :not_found, status: 404
  end

  def unacceptable
    render :unacceptable, status: 422
  end

  def internal_error
    render :internal_error, status: 500
  end
end
