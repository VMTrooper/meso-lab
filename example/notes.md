# Deploy app via 

curl -vX POST http://node1:8080/v2/apps/ -H "Content-Type: application/json" -d @testport.json


# Notes
if JSON doesn't specify port, port reported via Marathon will be incorrect, and app will run on default port.  See test.json