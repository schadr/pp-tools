#!/bin/bash -xe

ip=$1
entity=$2

curl -X DELETE -ks --key /etc/keys/machine.privkey --cert /etc/keys/machine.crt https://${ip}:19000/photon/cloudstore/entity-locks/$entity
curl -X DELETE -ks --key /etc/keys/machine.privkey --cert /etc/keys/machine.crt https://${ip}:19000/photon/cloudstore/entity-locks/$entity

curl  -X POST -H "Content-Type: application/json" -H "pragma: xn-force-index-update" -d "{\"entityKind\": \"persistent-disk\", \"lockOperation\": \"ACQUIRE\", \"ownerTaskId\": \"no-swearing\", \"entitySelfLink\": \"/photon/cloudstore/vms/$entity\", \"documentSelfLink\": \"/photon/cloudstore/entity-locks/$entity\", \"documentKind\": \"com:vmware:photon:controller:cloudstore:xenon:entity:EntityLockService:State\", \"entityId\": \"$entity\", \"documentEpoch\": 900}" -ks --key /etc/keys/machine.privkey --cert /etc/keys/machine.crt https://${ip}:19000/photon/cloudstore/entity-locks

curl  -X POST -H "Content-Type: application/json" -H "pragma: xn-force-index-update" -d "{\"entityKind\": \"persistent-disk\", \"lockOperation\": \"RELEASE\", \"ownerTaskId\": \"no-swearing\", \"entitySelfLink\": \"/photon/cloudstore/vms/$entity\", \"documentSelfLink\": \"/photon/cloudstore/entity-locks/$entity\", \"documentKind\": \"com:vmware:photon:controller:cloudstore:xenon:entity:EntityLockService:State\", \"entityId\": \"$entity\", \"documentEpoch\": 900}" -ks --key /etc/keys/machine.privkey --cert /etc/keys/machine.crt https://${ip}:19000/photon/cloudstore/entity-locks
