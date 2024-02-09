# Nginx Annotations and Avi Equivalents

This README provides annotations for configuring Nginx features in Kubernetes Ingress along with their Avi equivalents.

## Proxy Read Timeout

**Nginx Annotation:** `nginx.ingress.kubernetes.io/proxy-read-timeout: "1200"`

Sets the timeout in seconds for reading a response from the proxied server.

**Avi Equivalent:** 
- **UI:** Pool > Advanced > Connection Idle Timeout in ms

## Proxy Send Timeout & Proxy Body Size

**Nginx Annotations:** 
- `nginx.ingress.kubernetes.io/proxy-send-timeout:"60`
- `nginx.ingress.kubernetes.io/proxy-body-size: 16m`

Sets the timeout in seconds for transmitting a request to the proxied server and the maximum allowed size of the client request body.

**Avi Equivalent:** 
- **UI:** Templates > Application > System HTTP profile > DDOS
  - Client Header Timeout in ms
  - Client Body Timeout in ms
  - Post Accept Timeout in ms
  - Client Max Body Size in KB

- **Terraform**
	- [systemHttpProfile.tf](systemHttpProfile.tf)

## SSL Redirect

**Nginx Annotations:** 
- `nginx.ingress.kubernetes.io/force-ssl-redirect: "true"`
- `nginx.ingress.kubernetes.io/ssl-redirect: "false"`

**Avi Equivalent:** 
- **UI:** Templates > Application > System HTTP profile > Security
  - Check HTTP_to_HTTPS redirection option

- **Terraform**
  - [systemHttpProfile.tf](systemHttpProfile.tf)


## Cookie

**Nginx Annotations:** 
- `nginx.ingress.kubernetes.io/session-cookie-name: "route"`
- `nginx.ingress.kubernetes.io/session-cookie-expires: "172800"`
- `nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"`
- `nginx.ingress.kubernetes.io/session-cookie-hash: sha1`

**Avi Equivalent:** 
- **UI:** Templates > Persistence > HTTP Cookie profile
  - HTTP Cookie Name: route
  - Persistence Timeout: in minutes

- **Terraform**
  - [cookiePersistenceProfile.tf](cookiePersistenceProfile.tf)

## HTTP Redirect Policy

**Nginx Annotation:** `nginx.ingress.kubernetes.io/rewrite-target: /`

**Avi Equivalent:** 
- **UI:** Applications > Virtual Services, select the desired virtual services, and select the HTTP Request policy option.
  - Create new HTTP redirect rule

- **Terraform**
  - [httpPolicySet.tf](httpPolicySet.tf)

## Alias

**Nginx Annotation:** `nginx.ingress.kubernetes.io/server-alias: oms-communication-service-dev.kroger.com`

**Avi Equivalent:** 
- [HostRule](CRDs/hostRule.yaml ) CRD > aliases option

## Regex

**Nginx Annotation:** `nginx.ingress.kubernetes.io/use-regex: "true"`

## Auth Profile

**Nginx Annotation:** `nginx.ingress.kubernetes.io/auth-type: basic`


## Avi AKO CRDs

- ### [httpRule](CRDs/httpRule.yaml)
- ### [hostRule](CRDs/hostRule.yaml )
- ### [l4Rule](CRDs/l4rule.yaml )
- ### [aviInfraSettings](CRDs/aviInfraSettings.yaml)
- ### [ssoRule](CRDs/ssoRule.yaml)


For detailed documentation on Avi CRDs please refer to the [AKO CRD Docs folder](https://github.com/vmware/load-balancer-and-ingress-services-for-kubernetes/tree/master/docs/crds).




