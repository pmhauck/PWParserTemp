#pwParser2.rb

#Ruby script for accessing API's <programmableweb.com>, and save it to disk
#as JSON file "localJsonDump.json"
#Uses Rugy get method.
#Requires local file 'pwApiKey.text'

#Peter Hauck

#Initialization
	require 'open-uri'
	require 'rubygems'
	require 'crack'
	require 'json'
	require 'net/http'
	print "\t"+"Passed: 'require' statements."+"\n"

#Open Local API Key file and pass to string suitable for URL
	apiKeyFile = File.open('pwApiKey.text','rb')
	apiKeyString = "?apikey=" + apiKeyFile.read	
	apiKeyString = apiKeyString.split("\n").first#DELETE \n left over from readfile 
	apiKeyFile.close	
	print "\t"+"Passed: open api key file.\n"
	
#Concat query string
	altString = "&alt=json" 
	queryString = apiKeyString + altString
	targetURL = URI.parse('http://api.programmableweb.com/apis/google-maps')
	targetURL = targetURL + queryString

#Make GET request. I don't know how this works in detail. 
	http = Net::HTTP.new(targetURL.host, targetURL.port)
	request = Net::HTTP::Get.new(targetURL.request_uri)
	print "\t"+"Passed: GET request to  targetURL "+"\n"	
	responseString = http.request(request).body	
	print "\t"+"Passed: GET response from  targetURL "+"\n"

#Write JSON to file
	file = File.open("localJsonDump.json",'w')
	file.write(responseString)	
	file.close
	print "\t"+"Passed: writing JSON response to: 'localJsonDump.json'."+"\n"

#Exit Routine
sleep 2
print "\t"+"Exiting."+"\n"
