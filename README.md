# 🚀 Adam DevOps Infrastructure  

<!-- Badges -->
[![Deploy Web](https://github.com/adam-devopss/adam-devops-infra/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/adam-devopss/adam-devops-infra/actions/workflows/deploy.yml)
![OpenTofu](https://img.shields.io/badge/OpenTofu-IaC-5C4EE5?logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-Automation-EE0000?logo=ansible&logoColor=white)
![Yandex Cloud](https://img.shields.io/badge/Yandex_Cloud-Infrastructure-FFCC00?logo=yandexcloud&logoColor=black)
![License: MIT](https://img.shields.io/badge/license-MIT-green)


**Полностью автоматизированная инфраструктура проекта с CI/CD, бэкапами и SSL.**  
Этот проект демонстрирует навыки DevOps-инженера по созданию облачной инфраструктуры с нуля с применением современных инструментов:  

🧱 **OpenTofu (Terraform fork)** — инфраструктура как код  
🐧 **Ansible** — автоматизация конфигурации и деплоя  
☁️ **Yandex Cloud** — облако для хостинга  
🔐 **GitHub Actions** — CI/CD пайплайн  
💾 **Yandex Object Storage (S3)** — автоматические бэкапы и восстановление  

---

## 📁 Структура проекта

```
adam-devops-infra/
├── terraform/ # OpenTofu (Terraform) инфраструктура
│ ├── main.tf # Основная конфигурация
│ ├── network.tf # Сеть, security group и IP
│ ├── compute.tf # Виртуальная машина web
│ └── outputs.tf # Выходные данные (IP и др.)
│
├── ansible/
│ ├── inventories/prod.ini # Прод окружение
│ ├── playbooks/
│ │ ├── web.yml # Установка Nginx + SSL + deploy user
│ │ ├── backup.yml # Автоматические бэкапы в S3
│ │ ├── restore_latest.yml # Восстановление последнего бэкапа
│ │ └── rollback.yml # Откат по дате
│
├── .github/workflows/
│ └── deploy.yml # GitHub Actions для CI/CD
│
└── README.md
```

---

## ⚙️ Возможности

- 🚀 **Полный деплой из GitHub Actions** — пуш в `main` автоматически обновляет сервер  
- 🔒 **Безопасный доступ**: только пользователь `deploy`, root-логин отключён  
- 🔁 **Ежедневные бэкапы** в Yandex Object Storage  
- 🧹 **Очистка старых бэкапов** (хранится 14 последних)  
- ⏮ **Откат или восстановление** сайта из S3 одной командой  
- 🔐 **SSL (Let's Encrypt)** сертификаты автоматически обновляются  
- 🔧 **Автообновления безопасности** (unattended-upgrades)  

---

## 🧩 Основные команды

### ☁️ Развёртывание инфраструктуры
```bash
cd terraform/
tofu init -reconfigure
tofu apply
```

### 🐧 Настройка сервера
```
cd ..
ansible-playbook -i ansible/inventories/prod.ini ansible/playbooks/web.yml
```

### 💾 Проверка бэкапов
```
ansible -i ansible/inventories/prod.ini web -b -a \
  "s3cmd -c /root/.s3cfg ls s3://adam-devops-backups/"
```

### 🔁 Восстановление сайта
```
ansible-playbook -i ansible/inventories/prod.ini ansible/playbooks/restore_latest.yml
```

### ⏮ Откат к определённой дате
```
ansible-playbook -i ansible/inventories/prod.ini ansible/playbooks/rollback.yml \
  --extra-vars 'backup_date=06-10-25'
```

---

## 🧠 Что демонстрирует проект

🔹 **Infrastructure as Code (IaC)** — OpenTofu  
🔹 **Configuration Management** — Ansible  
🔹 **CI/CD** — GitHub Actions  
🔹 **Cloud Automation** — Yandex Cloud  
🔹 **Security & Access Control** — SSH hardening, sudo policy  
🔹 **Backup & Recovery** — через Object Storage  
🔹 **Monitoring & Self-healing** — автообновления и health-endpoint  

---

## 🧾 Автор

Adam Albakov
DevOps Engineer | Cloud Automation | IaC Enthusiast

🌐 adam-devops.ru
📧 albakov.adam2015@gmail.com

---

