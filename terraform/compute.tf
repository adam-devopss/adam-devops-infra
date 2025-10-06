output "web_public_ip" {
  value = yandex_vpc_address.web_ip.external_ipv4_address[0].address
}

data "yandex_compute_image" "ubuntu" {
  image_id = "fd82l73ac78777p8edco"
}


locals {
  ssh_pub = file("${path.module}/ssh.pub")
}

resource "yandex_compute_instance" "web" {
  name        = var.instance_name
  platform_id = "standard-v3"
  zone        = var.yc_zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 15
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.main.id
    nat                = true
    nat_ip_address     = yandex_vpc_address.web_ip.external_ipv4_address[0].address
    security_group_ids = [yandex_vpc_security_group.web_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${path.module}/ssh.pub")}"
  }

  labels = {
    role = "web"
    env  = "portfolio"
  }
}

output "web_vm_ip" {
  value = yandex_vpc_address.web_ip.external_ipv4_address[0].address
}

