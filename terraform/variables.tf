variable "cloud_id" {
  type        = string
  description = "ID облака Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "ID каталога Yandex Cloud"
}

variable "yc_zone" {
  type        = string
  description = "Зона размещения ресурсов"
  default     = "ru-central1-a"
}

variable "instance_name" {
  description = "Имя виртуальной машины"
  type        = string
  default     = "web-vm"
}

