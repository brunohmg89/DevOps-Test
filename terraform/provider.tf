variable "path" {
  default = "PATH_LOCATE_JSON"  
}

provider "google" {
  project     = "PROJECT_ID"
  zone        = "ZONE"
  credentials = "${file("${var.path}/ARQUIVO.json")}"
}