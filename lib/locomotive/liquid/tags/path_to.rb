module Locomotive
  module Liquid
    module Tags
      class PathTo < LinkTo

        def render(context)
          site  = context.registers[:site]

          if page = self.retrieve_page_from_handle(site, context)
            self.public_page_url(site, page)
          else
            '' # no page found
          end
        end

      end

      ::Liquid::Template.register_tag('path_to', PathTo)
    end
  end
end
