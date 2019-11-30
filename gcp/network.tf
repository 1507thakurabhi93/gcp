

#-------- Creating a vpc ----------#

resource "google_compute_network" "terraform_vpc" {
	name = "terraform-vpc"
        auto_create_subnetworks = "false"
 	routing_mode = "GLOBAL"
        project = "dryicepoc-242713"
}


#------ Creating firewall rules for the network ------------#

resource "google_compute_firewall" "allow_internal_terraform" {
	name = "allow-internal-terraform"
	network = "${google_compute_network.terraform_vpc.name}"
	allow {
		protocol = "icmp"
		}
	allow {
		protocol = "tcp"
		ports = ["0-65535"]
		}
	allow {
		protocol = "udp"
		ports = ["0-65535"]
		}

}



resource "google_compute_firewall" "allow_ssh_terraform" {
        name = "allow-ssh-terraform"
        network = "${google_compute_network.terraform_vpc.name}"
        allow {
		protocol = "tcp"
		ports = ["22"]
		}
	target_tags = ["ssh"]
}


#-------------- Creating the subnetwork ---------------------#


resource "google_compute_subnetwork" "terraform_subnet" {
	name = "terraform-subnet"
	ip_cidr_range = "10.2.0.0/16"
	network = "${google_compute_network.terraform_vpc.self_link}"
	region = "us-west1"
}	
