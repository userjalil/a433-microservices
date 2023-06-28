#!/bin/bash

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
sleep 10

kubectl get all

kubectl port-forward svc/order-service 3000 
