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
