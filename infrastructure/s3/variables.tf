variable "bucket_name" {
    description = "name for s3 bucket"
    type = string
    default = "zephyrus-enigmatica-server-backup"
}

variable "aws-access-key" {
    description = "access-key for aws account"
    type = string
    sensitive = true
}

variable "aws-secret-access-key" {
    description = "secret key for aws account"
    type = string
    sensitive = true
}