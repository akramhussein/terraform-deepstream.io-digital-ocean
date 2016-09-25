# terraform-deepstream.io-digital-ocean

Terraform for [deepstream.io](https://deepstream.io/) on DigitalOcean

## Requirements:

* [Terraform](https://www.terraform.io/).
* [Digital Ocean](https://www.digitalocean.com/) account

### Deploy

    git clone https://github.com/oba/terraform-deepstream.io-digital-ocean.git

    terraform plan \
        -var "do_token=<YOUR-DIGITAL-OCEAN-TOKEN>" \
        -var "private_key=<YOUR-PRIVATE-KEY>" \
        -var "public_key=<YOUR-PUBLIC-KEY>"
    ...
    ...
    terraform apply \
        -var "do_token=<YOUR-DIGITAL-OCEAN-TOKEN>" \
        -var "private_key=<YOUR-PRIVATE-KEY>" \
        -var "public_key=<YOUR-PUBLIC-KEY>"
    ...
    ...
    details = Droplet Public IP:
        <YOUR-DROPLET-IP>