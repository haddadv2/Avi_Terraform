# Applying terrform <httpProfile, cookiePersistence, HttpPolice, to multiple sites>  
module "controller_site_1" {
    source = "./modules/Site"
    avi_username   = var.sites[0].avi_username
    avi_password   = var.sites[0].avi_password
    avi_controller_ip = var.sites[0].avi_controller_ip
    avi_version    = var.sites[0].avi_version
}

module "controller_site_2" {
    source = "./modules/Site"
    avi_username   = var.sites[1].avi_username
    avi_password   = var.sites[1].avi_password
    avi_controller_ip = var.sites[1].avi_controller_ip
    avi_version    = var.sites[1].avi_version
}

