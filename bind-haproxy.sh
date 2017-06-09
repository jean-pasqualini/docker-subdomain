#!/bin/bash
docker stop haproxy 2>/dev/null
docker ps | tail -n +2 | awk '{print $(NF)}' | grep -v haproxy | xargs -n 1 -I'{}' echo --link {}:{} | xargs | xargs  -I'{}' echo 'docker run --rm --name=haproxy -d -p 80:80 -p 8000:8000 {} dockercloud/haproxy' > reload.sh && source reload.sh