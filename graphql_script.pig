register 'graphql_udfs.rb' using jruby as graphqlUdfs;
responce = LOAD 'data' USING graphqlUdfs.connect(api_url, api_key, querry);
dump responce