locals {
  # This spreadsheet must be shared to "Anybody with the link"
  csv_export_endpoint_url = "https://docs.google.com/spreadsheets/d/${var.google_sheets_id}/export?format=csv"

  csv_data = csvdecode(data.http.csv_export_endpoint_url_redirect.response_body)
}

data "http" "csv_export_endpoint" {
  url = local.csv_export_endpoint_url
}

data "http" "csv_export_endpoint_url_redirect" {
  url = data.http.csv_export_endpoint.response_headers["Location"]
}

output "result" {
  value = local.csv_data
}
