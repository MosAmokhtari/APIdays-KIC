# Kong-mesh demo instruction

## pre-req
demo-magic: tool to simulate typing (https://github.com/paxtonhare/demo-magic)
gh repo clone paxtonhare/demo-magic

optional but useful on mac OS:
kubeforwarder (to port-forward)
(https://kube-forwarder.pixelpoint.io/)

k3d 


## Before launching the demo script edit kong-mesh-demo.sh and modify variables to your env


DEMO_MAGIC=/Users/mos.amokhtari/kong/git-repos/demo-magic
LOG_SCRIPT=/Users/mos.amokhtari/script.log
KONG_MESH_VERSION=1.2.6

## In debug mode (-d) the command are written at once. If you remove the "-d " it will simulate someone typing
. $DEMO_MAGIC/demo-magic.sh -d

## Follow the steps in the $LOG_SCRIPT with a tail -f  $LOG_SCRIPT

enjoy !! 
