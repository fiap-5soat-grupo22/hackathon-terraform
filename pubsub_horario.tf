resource "google_pubsub_topic" "horario" {
  name = "horario"

  labels = {
    domain = "agendamento"
  }

  message_retention_duration = "86400s"
}

resource "google_pubsub_subscription" "horario_reservado" {
  name  = "horario.reservado"
  topic = google_pubsub_topic.horario.id

  message_retention_duration = "1200s"
  retain_acked_messages      = true

  # 20 minutes

  ack_deadline_seconds = 20

  labels = {
    domain = "agendamento"
  }

  filter = "attributes.event = \"horario.reservado\""

  expiration_policy {
    ttl = "300000s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  push_config {
    push_endpoint = "https://notificacoes-api-91827266597.southamerica-east1.run.app"

    attributes = {
      x-goog-version = "v1"
    }
  }
}