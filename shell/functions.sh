function splitCsv() {
    HEADER=$(head -1 $1)
    if [ -n "$2" ]; then
        CHUNK=$2
    else
        CHUNK=1000
    fi
    tail -n +2 $1 | split -l $CHUNK - $1_split_
    for i in $1_split_*; do
        sed -i -e "1i$HEADER" "$i"
    done
}

function doctl-k8s-token() {
    doctl kubernetes cluster kubeconfig show $1 | yq ".users[0].user.token"
}

function paksinvoke {
  resource_group=""
  cluster_name=""
  subscription=""
  if [ $2 = "dev_orica_anglo" ]; then
    resource_group="oreprohub-rg-dev-anglo-001"
    cluster_name="anglo-aks-dev-oreprohub-001"
    subscription="a21e02fd-03e3-484f-ab95-4cb1d995736e"
  elif [ $2 = "dev_anglo" ]; then
    resource_group="mneu-rg-dev-oreprohub-001"
    cluster_name="mneu-aks-dev-oreprohub-001"
    subscription="5d3e7eb8-eb53-409d-b9a9-8101f4a8e798"	  
  else
    >&2 echo "Unknown cluster"
    exit 1
  fi    
  current_subscription=$(az account show | jq -r .id)
  if [ $subscription != $current_subscription ]; then
    >&2 echo "Your subscription is currently $current_subscription, should be $subscription"
    exit 1
  fi  
  str="${@:3}"
  az aks command invoke --resource-group $resource_group --name $cluster_name -c "$1 $str"
}

function pkubectl {
  paksinvoke kubectl $@
}

function phelm {
  paksinvoke helm $@
}

function az_login {
  export AZURE_CONFIG_DIR="/home/lpostula/.azure/$1"
  if [ -z "$2" ] || [ $2 != "--silent" ]; then
    az login  --use-device-code
  fi
}
