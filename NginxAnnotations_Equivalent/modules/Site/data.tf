data "avi_tenant" "tenantID" {
  name= var.tenant_ref
 }

#data "avi_cloud" "cloudID" {
#  for_each = toset(var.seGroup)
#  name= var.seGroup["cloud_ref"]
# }

