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
  default = "99.81.176.239/32"
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
}

variable "TFC_WORKSPACE_SSH_KEY" {
    type = string
}