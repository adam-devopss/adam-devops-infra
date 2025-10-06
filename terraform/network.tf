resource "yandex_vpc_network" "main" {
  name = "net-main"
}

resource "yandex_vpc_subnet" "main" {
  name           = "subnet-main"
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.0.0/24"]
}

resource "yandex_vpc_address" "web_ip" {
  name = "web-ip"
  external_ipv4_address {
    zone_id = var.yc_zone
  }
}

resource "yandex_vpc_security_group" "web_sg" {
  name       = "web-sg"
  network_id = yandex_vpc_network.main.id

  ingress {
    protocol       = "TCP"
    description    = "SSH from my IP"
    port           = 22
    v4_cidr_blocks = ["5.18.235.51/32"]
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTPS"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all egress"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}


