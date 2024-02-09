resource "avi_applicationpersistenceprofile" "cookie_profile_1" {
    name = var.cookie_profile["name"]
    tenant_ref = data.avi_tenant.tenanID.id
    is_federated = false
    persistence_type = "PERSISTENCE_TYPE_HTTP_COOKIE"
    http_cookie_persistence_profile {
        always_send_cookie = false
        cookie_name = var.cookie_profile["cookie_name"]
        http_only = false
        is_persistent_cookie = false
        timeout = var.cookie_profile["timeout"]
    }
}
