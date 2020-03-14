# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.homeoncall.com"
require 'google/cloud/storage'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::GoogleStorageAdapter.new(
  credentials: ENV['GOOGLE_APPLICATION_CREDENTIALS'],
  project_id: 'homeoncall',
  bucket: 'homeoncall.com'
)

SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_host = "https://console.cloud.google.com/storage/browser/homeoncall.com"
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
    add public_service_path(service), :changefreq => 'weekly', :lastmod => service.updated_at
    Town.find_each do |town|
      add public_bulk_service_path(service, town), :changefreq => 'weekly', :lastmod => service.updated_at
        Market.find_each do |market|
          add public_town_path(market, town), :changefreq => 'weekly', :lastmod => town.updated_at
        end 
    end 

    Market.find_each do |market|
      add public_market_service_path(market, service), :changefreq => 'weekly', :lastmod => service.updated_at
    end
  end 

  Market.find_each do |market|
    add public_market_path(market), :changefreq => 'monthly', :lastmod => market.updated_at
  end 



end
