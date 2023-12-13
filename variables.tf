variable "project_name" {
  type        = string
  description = "name of the project"
}
variable "project_env" {
  type        = string
  description = "environment of the project"
}
variable "project_owner" {
  type        = string
  description = "owner of the project"
}
variable "ami_id" {
  type        = string
  description = "ami id of the instance"
}
variable "instance_type" {
  type        = string
  description = "type of the instance"
}
variable "hosted_zone_name" {
  type        = string
  description = "domain name hosted in route 53"
}
variable "hostname" {
  type        = string
  description = "hostname"
  default     = "terraform"
}
