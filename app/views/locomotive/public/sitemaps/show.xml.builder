xml.instruct!
xml.sitemapindex "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  current_site.locales.each do |locale|
    xml.sitemap do
      xml.loc main_app.sitemap_url(locale: locale)
    end
  end
end
