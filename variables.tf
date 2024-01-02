variable "availability_zones" {
    type = list (string)
    default = ["us-east-1a", "us-east-1b"]    
}

variable "aws_key_name"{
    type = string
    description = "Nazw klucza dodanego w AWS"
}

variable "ssh_key_path" {
    type = string
    description = "Lokalna ścieżka do klucza SSH"
}
variable "bucket_name" {
  #  default = "bartlomiej-zdunek-panda-devops-core-16"
}