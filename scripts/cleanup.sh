#!/usr/bin/env bash

set -eo pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TFDIR="$(cd ${SCRIPTDIR}/../terraform; pwd )"

kubectl delete deployment -n tenant1 --wait --ignore-not-found
kubectl delete deployment -n tenant2 --wait --ignore-not-found
kubectl delete statefulset -n tenant1 --wait --ignore-not-found
kubectl delete statefulset -n tenant2 --wait --ignore-not-found
kubectl delete svc -n tenant1 --wait --ignore-not-found
kubectl delete svc -n tenant2 --wait --ignore-not-found
kubectl delete pvc -n tenant1 --wait --ignore-not-found
kubectl delete pvc -n tenant2 --wait --ignore-not-found

kubectl delete ns tenant2 --wait --ignore-not-found
kubectl delete ns tenant1 --wait --ignore-not-found
kubectl delete pvc -n trident-protect --wait --ignore-not-found

terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_ap_svc_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_app_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -auto-approve