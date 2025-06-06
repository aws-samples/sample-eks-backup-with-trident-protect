apiVersion: v1
kind: Service
metadata:
  name: ui
  labels:
    helm.sh/chart: ui-0.0.1
    app.kubernetes.io/name: ui
    app.kubernetes.io/instance: ui
    app.kubernetes.io/component: service
    app.kuberneres.io/owner: retail-store-sample
    app.kubernetes.io/managed-by: Helm
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: external
    service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: instance
    service.beta.kubernetes.io/aws-load-balancer-scheme: "internet-facing"
spec:
  type: LoadBalancer
  loadBalancerSourceRanges:
  - ${loadBalancerSourceRanges}
  ports:
    - port: 80
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: ui
    app.kubernetes.io/instance: ui
    app.kubernetes.io/component: service
    app.kuberneres.io/owner: retail-store-sample