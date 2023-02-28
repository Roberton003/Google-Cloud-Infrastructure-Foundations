rrecurso "google_compute_instance" "tf-instance-1" {
  nome = "tf-instância-1"
  machine_type = "n1-standard-1"
  zona = var.zona

  boot_disk {
    inicializar_params {
      image = "debian-cloud/debian-11"
    }
  }

  interface_de_rede {
rede = "padrão"
  }
}

recurso "google_compute_instance" "tf-instance-2" {
  nome = "tf-instância-2"
  machine_type = "n1-standard-1"
  zona = var.zona


boot_disk {
    inicializar_params {
      image = "debian-cloud/debian-11"
    }
  }

  interface_de_rede {
rede = "padrão"
  }
}