require 'rubygems'
require 'bundler'
require 'pry'
Bundler.require :default

data = JSON.load( File.new("data/grid/grid.json") )

orgs = []

data["institutes"].each do |org|
  if org["status"] == "active"
    orgs << {
        id: org["id"],
        name: org["name"],
        types: org["types"],
        links: org["links"],
        aliases: org["aliases"],
        acronyms: org["acronyms"],
        wikipedia_url: org["wikipedia_url"],
        labels: org["labels"],
        country: {
            country_code: org["addresses"][0]["country_code"],
            country_name: org["addresses"][0]["country"]
        }
    }
  end
end

JSON.dump( {orgs: orgs}, File.open("data/org-id-grid.json", "w") )
