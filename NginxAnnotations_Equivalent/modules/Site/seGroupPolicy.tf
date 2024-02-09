resource "avi_serviceenginegroup" "sg1" {
    auto_rebalance                 = var.seGroup["auto_rebalance"]
    auto_rebalance_capacity_per_se = [
        var.seGroup["auto_rebalance_capacity_per_se"],
    ]
    auto_rebalance_criteria        = [
        var.seGroup["auto_rebalance_criteria"],
    ]
    cloud_ref                      = data.avi_cloud.cloudID.id                   
    max_cpu_usage                  = var.seGroup["max_cpu_usage"]
    min_cpu_usage                  = var.seGroup["min_cpu_usage"]
    name                           = var.seGroup["name"]
    tenant_ref                     = data.avi_tenant.tenanID.id

}