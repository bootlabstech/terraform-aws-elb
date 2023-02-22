variable "elb_name" {
  type        = string
  description = "describe your variable"
  default     = "foobar-terraform-elb"
}

variable "availability_zones" {
  type        = list(string)
  description = "(optional) describe your variable"

}

variable "instance_port" {
  type        = number
  description = "(optional) describe your variable"
}

variable "instance_protocol" {
  type        = string
  description = "(optional) describe your variable"
}

variable "lb_port" {
  type        = number
  description = "(optional) describe your variable"
}

variable "lb_protocol" {
  type        = string
  description = "(optional) describe your variable"
}

variable "region" {
  type        = string
  description = "(optional) describe your variable"
}

variable "instance_id" {
  type =set(string)
  description = "describe your variable"
}
variable "ssl_certificate_id" {
  description = "The ARN of an SSL certificate you have uploaded to AWS IAM. Note ECDSA-specific restrictions below. Only valid when lb_protocol is either HTTPS or SSL"
  type = string
}
 variable "cross_zone_load_balancing" {
  type = bool
  default = true
  description = "Enable cross-zone load balancing"
   
 }
 variable "desync_mitigation_mode" {
  description = "Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are monitor, defensive (default), strictest."
  type = string
  default = "defensive"
 }
 variable "connection_draining" {
   description = "Boolean to enable connection draining"
   type = bool
   default = true
 }
 variable "connection_draining_timeout" {
  description = "valThe time in seconds to allow for connections to drainue"
  type = number
  default = 400
 }
 variable "access_logs_enabled" {
  type = bool
  default = true
  description = "Boolean to enable / disable access_logs"
 }
 variable "access_logs_bucket" {
  type = string
  description = "The S3 bucket name to store the logs in."
 }
 variable "access_logs_bucket_prefix" {
  type = string
  description = "The S3 bucket prefix. Logs are stored in the root if not configured."
   
 }