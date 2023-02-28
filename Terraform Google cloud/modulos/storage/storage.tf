recurso "google_storage_bucket" "storage-bucket" {
  nome = "BUCKET_NAME"
  localização = "EUA"
  force_destroy = verdadeiro
  uniform_bucket_level_access = verdadeiro
}