#basic ruby program for getting me started in Ruby and git. Based on propublica template

#require statements

require 'open-uri'
require 'rubygems'
require 'crack'
require 'json'
#require 'json_pure'


print "Passed: 'require' statements."+"\n"

targetURL = "http://feeds2.feedburner.com/programmableweb/apis"

#file = open("http://feeds2.feedburner.com/programmableweb/apis")

page = open(targetURL)

#print "Passed: open targetURL"

#file = File.open("tempLocalXmlDump.xml",'w')

#print "Passed open temp file for XML Dump."

#file.write(page.readlines)

#print "Passed file.write"

#file.close

#print "Passed file.close"

parsedXML = Crack::XML.parse(page)

print "I'm using crack! No, not that kind."

parsedJSON = parsedXML.to_json

file = File.open("localJsonDump.json",'w')

file.write(parsedJSON)

file.close
# wait 2 seconds
sleep 2

print "\n"
