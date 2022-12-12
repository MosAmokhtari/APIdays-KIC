#!/bin/bash


##################
# Set the env variables,
##################

GW_API_DIR=$PWD
DEMO_MAGIC=$GW_API_DIR/magic
LOG_SCRIPT=$GW_API_DIR/script.log
KIC_VERSION=2.7.0
K8S_GW_API_VERSION=v0.5.1


########################
# include the magic
########################
. $DEMO_MAGIC/demo-magic.sh -d

rm $LOG_SCRIPT
######################
# hide the evidence
######################
clear
#####################
# start the show , you can follow the step by step task using tail -f $LOG_SCRIPT
#####################
echo -e "This is the beginning of the demo, fasten your seatbelt" > $LOG_SCRIPT
######################
# Cluster installation
######################

#echo -e "K3d install- First we create a K3s cluster to deploy \n  our application and Kuma to illustrate the mesh's capabilities in Kubernetes mode. /n" >> $LOG_SCRIPT

#pe "k3d cluster create GWAPI  --k3s-arg '--no-deploy=traefik@server:0' -p '9000:31000@agent:0' -p '9001:31001@agent:0' -p '9002:31002@agent:0' -p '9003:31003@agent:0' -p '9004:31004@agent:0' -p '9100:31100@agent:0' -p '9443:31443@agent:0' --agents 1 "

#echo -e "K3d install: let's check if the system pods are ready \n" >> $LOG_SCRIPT
#echo -e "type control+c to exit command and continue" >> $LOG_SCRIPT

pe "kubectl get pods -A  -w "


######################
#GW API CRDS
#####################

#pe "kubectl apply -k 'github.com/kubernetes-sigs/gateway-api/config/crd?ref=$K8S_GW_API_VERSION' "
#pe "kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/$K8S_GW_API_VERSION/deploy/admission_webhook.yaml"
#pe "kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/$K8S_GW_API_VERSION/deploy/certificate_config.yaml"


pe "kubectl apply -k 'github.com/kubernetes-sigs/gateway-api/releases/download/v0.5.1/experimental-install.yaml"

#######################
#install KIC
######################


#pe "kubectl apply -f ./kubernetes/all_namespaces.yaml"
#pe "kubectl apply -f ./kubernetes/kong_license.yaml -n kong"
#pe "kubectl create secret generic  kong-enterprise-superuser-password --from-literal=password=Kong123kong -n kong"
#pe "kubectl apply -f ./kubernetes/k4k8s-enterprise-install-withDB-mod.yaml"
#pe "kubectl apply -f ./kubernetes/k4k8s-enterprise-install-withDB-mod.yaml"
#pe "kubectl apply -f ./kubernetes/k4k8s-enterprise-install-withDB-mod-noRBAC.yaml"
#pe "kubectl apply -f ./kubernetes/kong_services.yaml"
#pe "kubectl apply -f ./kubernetes/ingress-stripPath.yaml -n kong"



#######################
# Demo app installation
#######################

pe "kubectl apply -f ./kubernetes/echo-service"


########################
#actions examples
########################


pe " kubectl apply -f ./kubernetes/GatewayClass.yaml"
pe " kubectl apply -f ./kubernetes/Gateway.yaml"
pe " kubectl apply -f ./kubernetes/HTTProute.yaml"


