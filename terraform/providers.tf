terraform {
  required_providers {
    yandex = {
      source  = "registry.opentofu.org/yandex-cloud/yandex"  
      version = "0.120.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = "${path.module}/key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.yc_zone
}

