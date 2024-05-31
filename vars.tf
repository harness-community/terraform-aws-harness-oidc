variable "harness_account_id" {
  type        = string
  description = "ID of the Harness account that can use this role"
}

variable "thumbprint" {
  type        = string
  description = "A server certificate thumbprint for the OpenID Connect (OIDC) identity provider's server certificate"
  default     = "df3c24f9bfd666761b268073fe06d1cc8d4f82a4"
}

variable "name" {
  type        = string
  description = "Friendly name of the role"
  default     = null
}

variable "path" {
  type        = string
  description = "Path to the role"
  default     = null
}

variable "description" {
  type        = string
  description = "Description of the role"
  default     = null
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration (in seconds) that you want to set for the specified role"
  default     = 3600
}

variable "permissions_boundary" {
  type        = string
  description = "ARN of the policy that is used to set the permissions boundary for the role."
  default     = null
}