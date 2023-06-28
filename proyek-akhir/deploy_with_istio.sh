#!/bin/bash
echo "Instalasi Istio"
curl -L https://istio.io/downloadIstio | sh -

cd istio-1.18.0

export PATH=$PWD/bin:$PATH

istioctl install --set profile=demo -y

sleep 5
kubectl label namespace default istio-injection=enabled

cd ..
echo

echo "Melakukan deploy RabbitMQ"
kubectl apply -f kubernetes/rabbitmq.yaml
echo
sleep 10

echo "Melakukan deploy Order App"
kubectl apply -f kubernetes/order-app.yaml
echo
sleep 5

echo "Melakukan deploy Shipping App"
kubectl apply -f kubernetes/shipping-app.yaml
echo
sleep 5

echo "Menambahkan gateway dan virtualservice istio"
kubectl apply -f kubernetes/istio.yaml
echo
sleep 5

kubectl get all