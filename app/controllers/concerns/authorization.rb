module Authorization
  extend ActiveSupport::Concern

  included do


    class NotAuthorizedError < StandardError; end
    rescue_from NotAuthorizedError do
      redirect_to reservations_path, alert: t('common.not_authorized')
    end

    class PermissionDenied < StandardError; end
    rescue_from PermissionDenied do
      render json: { error: t('common.permission_denied') }, status: :unauthorized
    end

    private

    def authorize! record = nil, raised_class = NotAuthorizedError
      is_allowed =  "#{controller_name.singularize}Policy".classify.constantize.new(record).send(action_name)
      raise raised_class unless is_allowed
    end

    def authorize_api! record = nil, raised_class = PermissionDenied
      authorize! record, raised_class
    end

  end
end