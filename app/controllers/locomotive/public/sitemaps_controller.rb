module Locomotive
  module Public
    class SitemapsController < Public::BaseController

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

    end
  end
end