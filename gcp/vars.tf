variable "image" {
	description = "choose the OS type"
}

variable "os_type" {
	type = "map" 
	default = {
		centos = "centos-7-v20190916"
		rhel = "rhel-7-v20190916"
		}
}



