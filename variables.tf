variable pve_hostname {
    type = string
}

variable pve_api_token_id {
    type = string
    sensitive = true
}

variable pve_api_token_secret {
    type = string
    sensitive = true
}