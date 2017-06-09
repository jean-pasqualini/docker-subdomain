docker run --rm --name=haproxy -d -p 80:80 -p 8000:8000 --link branchB:branchB --link branchA:branchA dockercloud/haproxy
