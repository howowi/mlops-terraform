## Autonomous Database ##

resource oci_database_autonomous_database mlops-adb-apex {
    compartment_id = var.compartment_ocid
    db_name = "mlopsDb"
    display_name = "mlops-adb-apex"
    admin_password = var.mlops_adb_admin_password
    autonomous_maintenance_schedule_type = "REGULAR"
    cpu_core_count             = "1"
    data_safe_status           = "NOT_REGISTERED"
    data_storage_size_in_gb    = "1024"
    data_storage_size_in_tbs    = "1"
    db_version                 = "19c"
    db_workload                = "APEX"
    is_auto_scaling_enabled     = "true"
    is_data_guard_enabled       = "false"
    is_dedicated                = "false"
    is_free_tier                = "false"
    is_mtls_connection_required = "true"
    # kms_key_id    = "ORACLE_MANAGED_KEY"
    license_model = "LICENSE_INCLUDED"
    open_mode                  = "READ_WRITE"
    operations_insights_status = "NOT_ENABLED"
    permission_level           = "UNRESTRICTED"
    state = "AVAILABLE"
}