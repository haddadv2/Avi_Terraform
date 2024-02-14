resource "avi_serviceenginegroup" "sg1" {
    for_each =  { for group in var.seGroup : group.name => group }
    auto_rebalance                 = each.value["auto_rebalance"]
    auto_rebalance_capacity_per_se = [
        each.value["auto_rebalance_capacity_per_se"],
    ]
    auto_rebalance_criteria        = [
        each.value["auto_rebalance_criteria"],
    ]
    cloud_ref                      = each.value["cloud_ref"]                 
    max_cpu_usage                  = each.value["max_cpu_usage"]
    min_cpu_usage                  = each.value["min_cpu_usage"]
    name                           = each.value["name"]
    tenant_ref                     = data.avi_tenant.tenantID.id

}