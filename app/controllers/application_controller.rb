class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  private

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    available = %w(en en-NZ en-AU)
    I18n.locale = http_accept_language.preferred_language_from(available) || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
end
