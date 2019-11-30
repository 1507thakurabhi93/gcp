
#----------- Creating a instance ---------#

resource "google_compute_instance" "instance-terraform-1" {
	name = "instance-terraform-1"
	machine_type = "f1-micro"
	tags = ["ssh"]
	zone = "us-west1-a"
	boot_disk {
		initialize_params {
			image = "${lookup(var.os_type,var.image)}"
				}
		}
	network_interface {
		subnetwork = "${google_compute_subnetwork.terraform_subnet.name}"
		access_config {
			network_tier = "STANDARD"
				}
		}
}
