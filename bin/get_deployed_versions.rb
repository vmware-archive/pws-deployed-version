#!/usr/bin/env ruby
require 'cli'
require 'json'

deployment_name=ARGV[0]
releases_name=ARGV[1..-1]
raise 'no deployment name specified' if deployment_name.nil?
raise 'no releases specified' if releases_name.empty?

target = ENV["BOSH_DIRECTOR"]
ca_cert = ENV["BOSH_CA_CERT_PATH"]

token_decoder = Bosh::Cli::Client::Uaa::TokenDecoder.new
director_client = Bosh::Cli::Client::Director.new(target, nil, ca_cert: ca_cert)
auth_info = Bosh::Cli::Client::Uaa::AuthInfo.new(director_client, ENV, ca_cert)

token_provider = Bosh::Cli::Client::Uaa::TokenProvider.new(auth_info, nil, token_decoder, target)

credentials = Bosh::Cli::Client::UaaCredentials.new(token_provider)
auth_director = Bosh::Cli::Client::Director.new(target, credentials, { ca_cert: ca_cert })

output = auth_director.list_deployments

deployment_details = output.select {|d| d["name"] == deployment_name }.first
stemcell_details = deployment_details["stemcells"].first

final_output = deployment_details["releases"].each_with_object([]) do |release_hash, memo|
  if releases_name.include?(release_hash['name'])
    memo << { "release" => release_hash, "stemcell" => stemcell_details}
  end
end

puts final_output.to_json
