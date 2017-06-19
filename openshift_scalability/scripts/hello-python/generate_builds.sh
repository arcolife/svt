#!/bin/bash

count=$1
registry='70.30.60.158:5000'

docker login  -u admin -p $(oc whoami -t) $registry

# for i in $(seq 31 $count); do 
#     sed s/\".\"/\"$i\"/g -i hello.py
#     docker build . -t hello$i 2>&1 > /dev/null
#     docker tag hello$i $registry/admin/hello$i
#     docker push $registry/admin/hello$i
#     image_object=`oc get image | grep 'admin/hello'$i | awk '{print $1}'`
#     oc patch image/$image_object -p '{ "metadata": { "labels": { "foo": "bar" }}}'
#     # oc describe image `oc get image | grep 'admin/hello' | awk '{print $1}'`
# done

for i in $(seq 1 $count); do 
    image_object=`oc get image | grep 'admin/hello'$i'@' | awk '{print $1}'`
    oc patch image/$image_object -p  '{ "metadata": { "labels": { "33d": "looo", "44": "33", "a":"b", "c":"d", "55":"33" }}}' &
done
