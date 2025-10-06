data "yandex_dns_zone" "main" {
  name = "adam-devops-zone"
}

resource "yandex_dns_recordset" "verify" {
  zone_id = data.yandex_dns_zone.main.id
  name    = "_verify.devops.adam-devops.ru."
  type    = "TXT"
  ttl     = 300
  data    = ["project=static-site; owner=adam"]
}

