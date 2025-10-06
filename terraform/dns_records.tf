resource "yandex_dns_recordset" "root_a" {
  zone_id = data.yandex_dns_zone.main.id
  name    = "adam-devops.ru."
  type    = "A"
  ttl     = 300
  data    = [yandex_vpc_address.web_ip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "www_cname" {
  zone_id = data.yandex_dns_zone.main.id
  name    = "www.adam-devops.ru."
  type    = "CNAME"
  ttl     = 300
  data    = ["adam-devops.ru."]
}

