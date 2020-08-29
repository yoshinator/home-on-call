# USAGE INSTRUCTIONS
# rake sitemap:create   #Create sitemaps without pinging search engines
# rake sitemap:refresh  #Create sitemaps and ping search engines
# rake sitemap:clean    #Clean up sitemaps in the sitemap path
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.homeoncall.com"
require 'google/cloud/storage'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::GoogleStorageAdapter.new(
  credentials: JSON.parse(ENV['GOOGLE_APPLICATION_CREDENTIALS']),
  project_id: 'homeoncall',
  bucket: 'homeoncall.com'
)

SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_host = "https://storage.cloud.google.com/homeoncall.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.ping_search_engines('https://www.homeoncall.com/sitemap')
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  Service.find_each do |service|
    add public_service_path(service), :changefreq => 'weekly', :lastmod => Time.now
  end 
  
  Town.find_each do |town|
    add public_town_path(town)
    Service.find_each do |service|
      add public_bulk_service_path(service, town),:priority => 1, :changefreq => 'weekly', :lastmod => Time.now
    end
  end 

  Market.find_each do |market|
    add public_market_path(market), :changefreq => 'monthly', :lastmod => Time.now
    Service.find_each do |service|
      add public_market_service_path(market, service), :changefreq => 'weekly', :lastmod => Time.now
    end 
  end

end
