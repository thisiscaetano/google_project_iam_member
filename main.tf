resource "null_resource" "grant_permissions" {
  count = length(var.project_id)

  provisioner "local-exec" {
    command = <<-EOT
      gcloud projects add-iam-policy-binding ${var.project_id[count.index]} \
        --member="serviceAccount:${var.service_account_email}" \
        --role="${var.role}"
    EOT
  }
}

resource "google_project_iam_member" "project_iam_member" {
  count   = length(var.project_id)
  project = var.project_id[count.index]
  role    = var.role
  member  = "serviceAccount:${var.service_account_email}"
}