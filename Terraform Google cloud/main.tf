terraforma {
  provedores_necessários {
    google = {
      fonte = "hashicorp/google"
      versão = "3.55.0"
    }
  }
}
# atualize o arquivo main.tf com o seguinte:
terraforma {
  infra-estrutura "gcs" {
    balde = "BUCKET_NAME"
prefixo = "terraforma/estado"
  }
  provedores_necessários {
    google = {
      fonte = "hashicorp/google"
      versão = "3.55.0"
    }
  }
}
provedor "google" {
  projeto = var.project_id
  região = var.região

  zona = var.zona
}

módulo "instâncias" {

  fonte = "./módulos/instâncias"

}
módulo "armazenamento" {
  fonte = "./módulos/armazenamento"
}
