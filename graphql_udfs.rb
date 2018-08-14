require 'pigudf'
require 'net/http'
require 'json'

class GraphqlUdfs < PigUdf

	# define in PIG: register 'graphql_udfs.rb' using jruby as graphqlUdfs;
	# use like: responce = graphqlUdfs.connect(aws_endpoint, api_key, querry='');
	outputSchema "word:chararray"
  def connect(aws_endpoint, api_key, querry='')
  	request = Net::HTTP.post(
  		URI(aws_endpoint), 
  		querry, 
  		'Content-Type' => 'application/graphql', 
  		'x-api-key' => api_key
		)
		JSON.parse request.body
  end
end
