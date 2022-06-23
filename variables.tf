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