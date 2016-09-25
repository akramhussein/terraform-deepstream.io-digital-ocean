output "details" {
  value = <<DETAILS
Droplet Public IP:
  ${digitalocean_floating_ip.deepstream.ip_address}

DETAILS
}
