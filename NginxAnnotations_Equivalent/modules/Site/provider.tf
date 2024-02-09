terraform {
  required_providers {
    avi = {
      source  = "vmware/avi"
      version = "21.1.6"
    } 
  }
  required_version = ">= 0.13"
}
// Configure the AVI provider
provider "avi" {
    avi_username   = var.avi_username
    avi_password   = var.avi_password
    avi_controller = var.avi_controller_ip
    avi_version    = var.avi_version

}

