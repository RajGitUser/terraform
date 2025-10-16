variable "instances" {
    default = ["mongodb","mysql","rabbitmq"]    ### as per requirement we can add the count here with the name not with the number
}

variable "zone_id" {
    default = "Z08088429XZJJZMETS6D"
}

variable "domain_name" {
    default = "rajkumardaws.space"
}