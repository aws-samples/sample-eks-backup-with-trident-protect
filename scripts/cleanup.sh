#!/usr/bin/env bash

set -eo pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TFDIR="$(cd ${SCRIPTDIR}/../terraform; pwd )"

# Add --all flag to delete all resources of each type
kubectl delete deployment --all -n tenant1 --wait --ignore-not-found
kubectl delete deployment --all -n tenant2 --wait --ignore-not-found
kubectl delete statefulset --all -n tenant1 --wait --ignore-not-found
kubectl delete statefulset --all -n tenant2 --wait --ignore-not-found
kubectl delete svc --all -n tenant1 --wait --ignore-not-found
kubectl delete svc --all -n tenant2 --wait --ignore-not-found
kubectl delete pvc --all -n tenant1 --wait --ignore-not-found
kubectl delete pvc --all -n tenant2 --wait --ignore-not-found

kubectl delete ns tenant2 --wait --ignore-not-found
kubectl delete ns tenant1 --wait --ignore-not-found
kubectl delete pvc --all -n trident-protect --wait --ignore-not-found

terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_ap_svc_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_app_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -auto-approve
