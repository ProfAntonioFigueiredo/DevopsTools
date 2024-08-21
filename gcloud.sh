
gcloud compute instance-templates create nucleus-lb-backend-template \
   --network=default \
   --subnet=default \
   --tags=allow-health-check \
   --machine-type=e2-medium \
   --image-family=debian-11 \
   --image-project=debian-cloud \
   --metadata=startup-script='#!/bin/bash
     apt-get update
     apt-get install nginx -y
     systemctl start nginx
     vm_hostname="$(curl -H "Metadata-Flavor:Google" \
     http://169.254.169.254/computeMetadata/v1/instance/name)"
     sed -i "s/nginx/Google Cloud Platform - $vm_hostname/" /var/www/html/index.nginx-debian.html
     systemctl restart nginx'


gcloud compute instances create nucleus-webserver2 \
    --zone=$ZONE\
    --tags=network-lb-tag \
    --machine-type=e2-micro \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --metadata=startup-script='#!/bin/bash
        apt-get update
        apt-get install nginx -y
        systemctl start nginx
        vm_hostname="$(curl -H "Metadata-Flavor:Google" \
        http://169.254.169.254/computeMetadata/v1/instance/name)"
        sed -i "s/nginx/Google Cloud Platform - $vm_hostname/" /var/www/html/index.nginx-debian.html
        systemctl restart nginx'


gcloud compute firewall-rules create allow-tcp-rule-218 --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server 

gcloud compute health-checks create http nucleus-health-check \
    --port=80 \
    --request-path=/healthz \
    --check-interval=30s \
    --timeout=10s \
    --unhealthy-threshold=3 \
    --healthy-threshold=2

    gcloud compute backend-services add-backend nucleus-backend-service \
    --instance-group=nucleus-instance-group \
    --instance-group-zone=$ZONE \
    --port-name=http \
    --global



