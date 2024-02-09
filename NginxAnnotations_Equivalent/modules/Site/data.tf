data "avi_tenant" "tenanID" {
  name= var.tenant_ref
 }

data "avi_cloud" "cloudID" {
  name= var.seGroup["cloud_ref"]
 }

