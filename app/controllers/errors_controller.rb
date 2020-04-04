class ErrorsController < ApplicationController
  def not_found
    @business_types = BusinessType.all
    render :not_found, status: 404
  end

  def unacceptable
    @business_types = BusinessType.all
    render :unacceptable, status: 422
  end

  def internal_error
    @business_types = BusinessType.all
    render :internal_error, status: 500
  end
end
