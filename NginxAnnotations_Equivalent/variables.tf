variable "avi_username" {
}
variable "avi_password" {
}
variable "avi_version" {
}
variable "avi_controller_ip" {
}

# Credentials for Avi clusters in different sites
variable "sites" {
  description = "List of avi controllers"
  type        = list(map(string))

  default = [
    {
       avi_username = ""
       avi_password = ""
       avi_controller_ip = ""
       avi_version = ""
    },
    {
       avi_username = ""
       avi_password = ""
       avi_controller_ip = ""
       avi_version = ""
    }   
  ]
}

# Tenant name

variable "tenant_ref" {
    default = "admin"
}

/*
Createing Cookie Persistence profile to apply following Nginx annorations 

- nginx.ingress.kubernetes.io/session-cookie-name: "route"
- nginx.ingress.kubernetes.io/session-cookie-expires: "172800"
- nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"

*/

variable "cookie_profile" {
    type = map(string)
    default = {
         name = "cookie_persistence_profile_terraform"
         cookie_name = "route" 
         #timeout in minutes, but inseconds in nginx annotation
         timeout =  "2880"   
    }
}

/*
Createing Http profile to apply following Nginx annorations 

- nginx.ingress.kubernetes.io/proxy-send-timeout:"60
- nginx.ingress.kubernetes.io/proxy-body-size: 16m
- nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
- nginx.ingress.kubernetes.io/ssl-redirect: "false"

*/

variable "http_profile" {
    type = map(string)
    default = {
         name = "system_http_profile_terraform"
         client-force-ssl-redirect = true
         backend-force-ssl-redirect = true
         header-proxy-send-timeout = "60000"
         body-proxy-send-timeout = "90000"
         #max body and heder size is in KB
         proxy-body-size = "16000"
           
    }
}

/* Creating Http Policy to apply following Nginx annotation

nginx.ingress.kubernetes.io/rewrite-target: /

*/
variable "http_policy_set" {
    default = {
        name = "rewrite_policySet_terraform"
        ruleName = "rewrite_rule_terraform"
    }
  
}

/* To Enable auto-Scaling on SE group level

available AutoScale Criteria:
 - se_auto_rebalance_cps          
 - se_auto_rebalance_cpu          
 - se_auto_rebalance_mbps         
 - se_auto_rebalance_open_conns   
 - se_auto_rebalance_pps 

 for more details please check 
 https://docs.vmware.com/en/VMware-NSX-Advanced-Load-Balancer/22.1/Configuration_Guide/GUID-7E1B17D9-E301-4C41-BF65-0FD545409FA7.html#GUID-7E1B17D9-E301-4C41-BF65-0FD545409FA7__id-f1d596b0-0c05-469d-e5eb-136c3d7f62d8
 
*/     
variable seGroup {
    type = map(string)
    default = {
         name = "Default_Group"
         cloud_ref  = "Default_Cloud"
         auto_rebalance = "true"
         auto_rebalance_criteria = "SE_AUTO_REBALANCE_PPS"
         auto_rebalance_capacity_per_se = "20000000"
         max_cpu_usage= "70"
         min_cpu_usage = "20"
           
    }
}
