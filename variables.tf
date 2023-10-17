variable "vpc_cidr" {
  type    = string
  default = "10.123.0.0/16" # for example
}

variable "access_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "cloud9_ip" {
  type    = string
  default = "63.32.87.24/32"
}

variable "main_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "main_vol_size" {
  type    = number
  default = 8
}

variable "main_instance_count" {
  type    = number
  default = 1
}

variable "key_name" {
  type = string

}

variable "public_key_path" {
  type = string
}

variable "ssh-rsa" {
  description = "The public SSH key"
  type        = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD8jvui8BH4fdUk/butPKvjLF/2Cfsl4sQ9RcmDw+fiapa9e1ojZDpxe31AQWlUbO7ZQTzL3WtDazNfvG4ckiZy08msUCLtOBPTyqNjQwwla9WchKElhPwooSAWOC0rZyE2mb8F7pX7kYljH05/yNW5LEdZBXKmr3fXCg/GEYuab88FpQFE2nEXurP9/7UPvLFP71lDn4CpFBQcT3SaARj2ozyYjvfDWQIiAsjCT0lQPQ5kcK03BppyoyzzR7Mk4/k+758PM7drc8Rh/OIRWjbhTfwnVLcfJjAPaVh1zpE4JpYGldD+78YykGQLP2IzWdhBM6zZlef5A+SFv810JSSS5aURZR13D29h2uX5d6+Bz1WYezGjPb3bLRuEAh4N3d8abtRARoNHCfyj9WhYZFaewPPusezCtvcmCJJSUlN0M6ERe19WWNoM13FlsfU1RMrpkdYzvvrH/gBvh68FFYoKziBRhkE5wDITHkND+QkCp9ISE1uaGStuFdoe/e4vqqE= ubuntu@ip-172-31-8-218"
}

# variable "TFC_WORKSPACE_SSH_KEY" {
#     type = string
# }