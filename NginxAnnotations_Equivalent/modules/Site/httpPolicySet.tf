resource "avi_httppolicyset" "rewriteTarget_policySet" {
    name       = var.http_policy_set["name"]
    tenant_ref = data.avi_tenant.tenanID.id
    http_request_policy {
        rules {
            enable = "true"
            index  = "1"
            name   = var.http_policy_set["ruleName"]

            rewrite_url_action {
                path {
                    type = "URI_PARAM_TYPE_TOKENIZED"

                    tokens {
                        str_value = "/"
                        type = "URI_TOKEN_TYPE_STRING"
                    }
                }
            }
        }
    }
}


