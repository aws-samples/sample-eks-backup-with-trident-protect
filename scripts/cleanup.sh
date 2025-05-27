#!/usr/bin/env bash

set -eo pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TFDIR="$(cd ${SCRIPTDIR}/../terraform; pwd )"

kubectl delete ns tenant2 --wait --ignore-not-found
kubectl delete ns tenant1 --wait --ignore-not-found

terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_ap_svc_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -target="kubectl_manifest.sample_app_tenant0" -auto-approve
terraform -chdir=$TFDIR destroy -auto-approve