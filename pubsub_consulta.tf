resource "google_pubsub_topic" "consulta" {
  name = "consulta"

  labels = {
    domain = "agendamento"
  }

  message_retention_duration = "86400s"
}

resource "google_pubsub_subscription" "consulta_solicitada" {
  name  = "consulta.solicitada"
  topic = google_pubsub_topic.consulta.id

  message_retention_duration = "1200s"
  retain_acked_messages      = true

  # 20 minutes

  ack_deadline_seconds = 20

  labels = {
    domain = "agendamento"
  }

  filter = "attributes.event = \"consulta.solicitada\""

  expiration_policy {
    ttl = "300000s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }


  push_config {
    push_endpoint = "https://agendamentos-api-91827266597.southamerica-east1.run.app"

    attributes = {
      x-goog-version = "v1"
    }
  }

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.consulta_compensatorio.id
    max_delivery_attempts = 5

  }
}

resource "google_pubsub_subscription" "consulta_criada" {
  name  = "consulta.criada"
  topic = google_pubsub_topic.consulta.id

  message_retention_duration = "1200s"
  retain_acked_messages      = true

  # 20 minutes

  ack_deadline_seconds = 20

  labels = {
    domain = "agendamento"
  }

  filter = "attributes.event = \"consulta.criada\""

  expiration_policy {
    ttl = "300000s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }


  push_config {
    push_endpoint = "https://agendamentos-api-91827266597.southamerica-east1.run.app"

    attributes = {
      x-goog-version = "v1"
    }
  }
}

resource "google_pubsub_subscription" "consulta_cancelada" {
  name  = "consulta.cancelada"
  topic = google_pubsub_topic.consulta.id

  message_retention_duration = "1200s"
  retain_acked_messages      = true

  # 20 minutes

  ack_deadline_seconds = 20

  labels = {
    domain = "agendamento"
  }

  filter = "attributes.event = \"consulta.cancelada\""

  expiration_policy {
    ttl = "300000s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }


  push_config {
    push_endpoint = "https://agendamentos-api-91827266597.southamerica-east1.run.app"

    attributes = {
      x-goog-version = "v1"
    }
  }
}

resource "google_pubsub_topic" "consulta_compensatorio" {
  name = "consulta_compensatorio"

  labels = {
    domain = "agendamento"
  }

  message_retention_duration = "86400s"
}

resource "google_pubsub_subscription" "consulta_solicitada_erro" {
  name  = "consulta.solicitada.erro"
  topic = google_pubsub_topic.consulta_compensatorio.id

  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  labels = {
    domain = "agendamento"
  }

  filter = "attributes.event = \"consulta.solicitada\""

  expiration_policy {
    ttl = "300000s"
  }

  retry_policy {
    minimum_backoff = "10s"
  }

  push_config {
    push_endpoint = "https://agendamentos-api-91827266597.southamerica-east1.run.app"

    attributes = {
      x-goog-version = "v1"
      teste          = "teste"
    }
  }
}