resource oci_logging_log_group export_oke-log-group {
  compartment_id = var.compartment_ocid
  display_name = "oke-log-group"
}

resource oci_logging_log export_oke-logs {
  display_name = "oke-logs"
  is_enabled         = "true"
  log_group_id       = oci_logging_log_group.export_oke-log-group.id
  log_type           = "CUSTOM"
  retention_duration = "30"
}

resource oci_logging_unified_agent_configuration export_oke-logging {
  compartment_id = var.compartment_ocid
  description  = "Logs from OKE Clusters"
  display_name = "oke-logging"
  group_association {
    group_list = [
      "ocid1.dynamicgroup.oc1..aaaaaaaafg7sbmokehzj2u6mrhvhnq7odqfxmp6jnodfx4guzstlfsmiz4ma",
    ]
  }
  is_enabled = "true"
  service_configuration {
    configuration_type = "LOGGING"
    destination {
      log_object_id = "ocid1.log.oc1.phx.amaaaaaap77apcqapn7mjtbqm5kpllbsxytnxszplrojcstesoge5alfheaa"
    }
    sources {
      #channels = <<Optional value not found in discovery>>
      name = "container_logs"
      parser {
        #delimiter = <<Optional value not found in discovery>>
        #expression = <<Optional value not found in discovery>>
        #field_time_key = <<Optional value not found in discovery>>
        #format = <<Optional value not found in discovery>>
        #format_firstline = <<Optional value not found in discovery>>
        #grok_failure_key = <<Optional value not found in discovery>>
        #grok_name_key = <<Optional value not found in discovery>>
        #is_estimate_current_event = <<Optional value not found in discovery>>
        #is_keep_time_key = <<Optional value not found in discovery>>
        #is_null_empty_string = <<Optional value not found in discovery>>
        #is_support_colonless_ident = <<Optional value not found in discovery>>
        #is_with_priority = <<Optional value not found in discovery>>
        #keys = <<Optional value not found in discovery>>
        #message_format = <<Optional value not found in discovery>>
        #message_key = <<Optional value not found in discovery>>
        #multi_line_start_regexp = <<Optional value not found in discovery>>
        #null_value_pattern = <<Optional value not found in discovery>>
        parser_type = "NONE"
        #patterns = <<Optional value not found in discovery>>
        #rfc5424time_format = <<Optional value not found in discovery>>
        #syslog_parser_type = <<Optional value not found in discovery>>
        #time_format = <<Optional value not found in discovery>>
        #time_type = <<Optional value not found in discovery>>
        #timeout_in_milliseconds = <<Optional value not found in discovery>>
        #types = <<Optional value not found in discovery>>
      }
      paths = [
        "/var/log/containers/*",
      ]
      source_type = "LOG_TAIL"
    }
  }
}

