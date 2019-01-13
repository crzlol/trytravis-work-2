# crzlol_infra
crzlol Infra repository

Самостоятельно задание:
ssh -A -J 35.233.12.253 10.132.0.3

Дополнительное задание:
в hosts на рабочей станции добавить имя Jump-хоста (бастиона),
в hosts на бастионе добавить имя someinternalhost,
в ~/.ssh/config добавить
Host someinternalhost
   ProxyJump bastion
в результате сможем на него ходить
ssh someinternalhost

bastion_IP = 35.233.12.253
someinternalhost_IP = 10.132.0.3

Создание виртуальной машины и автодеплой приложения:
gcloud compute instances create reddit-app-3  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --scopes storage-ro --metadata startup-script-url=https://gist.githubusercontent.com/crzlol/2e6a59aebbed514d80ddae03fec7a9ec/raw/4be1532e6c6a6d8f2a2df3435d65c6967f3805cb/startup.sh

Создание правила в firewall:
gcloud compute firewall-rules create default-puma-server-cli --allow tcp:9292 --direction INGRESS --target-tags puma-server

testapp_IP = 35.228.253.93
testapp_port = 9292