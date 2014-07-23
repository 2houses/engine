module Locomotive
  module Public
    class SitemapsController < Public::BaseController

      before_filter :set_locale

      respond_to :xml

      def show
        if params[:locale]
          @pages = current_site.pages.published.order_by(:depth.asc, :position.asc)
          I18n.locale = params[:locale]
        end
        respond_with(@pages) do |format|
          format.xml { render (params[:locale] ? :localized : :show) }
        end
      end

      protected

      def set_locale
        ::Mongoid::Fields::I18n.locale = params[:locale] || current_site.default_locale
        ::I18n.locale = ::Mongoid::Fields::I18n.locale
      end

    end
  end
end