#!/bin/bash
echo "ADDITIONAL_SERVICES=$(docker ps | tail -n +2 | awk '{print $(NF)}' | grep -v haproxy | xargs -n 1 -I'{}' echo docker-subdomain-infra:{} | xargs | sed 's/ /,/g')" > services.env