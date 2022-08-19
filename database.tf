## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "oci-adb" {
  count                                 = var.deploy_ATP ? 1 : 0
  source                                = "github.com/oracle-devrel/terraform-oci-arch-adb"
  providers                             = { oci = oci.targetregion }
  adb_database_db_name                  = var.ATP_database_db_name
  adb_database_display_name             = var.ATP_database_display_name
  adb_database_db_version               = var.ATP_database_db_version
  adb_password                          = var.ATP_password
  adb_database_db_workload              = "OLTP" # 
  adb_free_tier                         = false
  adb_database_cpu_core_count           = var.ATP_database_cpu_core_count
  adb_database_data_storage_size_in_tbs = var.ATP_database_data_storage_size_in_tbs
  compartment_ocid                      = var.compartment_ocid
  use_existing_vcn                      = false
  adb_private_endpoint                  = false
  adb_database_freeform_tags            = var.ATP_database_freeform_tags
  adb_database_license_model            = var.ATP_database_license_model
  is_data_guard_enabled                 = var.ATP_data_guard_enabled
  defined_tags                          = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

