provider "google" {
	credentials = "${file("svcfile")}"
	project = "dryicepoc-242713"
}
