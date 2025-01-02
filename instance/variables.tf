variable "Instance_type"{
    type = string
    default = "t2.medium"
}
variable "Security_group_ids"{
  type = list(string)
}
variable "ami"{
    type = string
    default = "ubuntu"
}  
variable "Auto_assign_IP"{
    type = string
    default = "disable"
}
variable "Key_pair"{
    type = string
    default = "key.pem"
}
variable "subnet"{
    type = string
}
