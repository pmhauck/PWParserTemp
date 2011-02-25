#pwParser1.rb

#Ruby script for downloading RSS feed from <programmableweb.com>, and save it to disk
#as JSON file "localJsonDump.json"

#Based on propublica webscraping template
#Peter Hauck

#Initialization
	require 'open-uri'
	require 'rubygems'
	require 'crack'
	require 'json'

	#print "Passed: 'require' statements."+"\n"
	
#Open programmableweb
	targetURL = "http://feeds2.feedburner.com/programmableweb/apis"
	page = open(targetURL)
	print "\t"+"opening URL "+"\n"

#Parse XML and pass it as JSON
	parsedXML = Crack::XML.parse(page)
	print "\t"+"I'm using crack! No, not that kind."+"\n"
	parsedJSON = parsedXML.to_json

#Write JSON to file
	file = File.open("localJsonDump.json",'w')
	file.write(parsedJSON)
	file.close
	print "\t"+"writing JSON script to: localJsonDump.json"+"\n"

#Exit Routine
sleep 2
print "\n"
