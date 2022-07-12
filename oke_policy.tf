## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "oci-policies" {
  count                         = var.create_IAM_OKE_policies ? 1 : 0
  source                        = "github.com/oracle-devrel/terraform-oci-arch-policies"
  providers                     = { oci = oci.homeregion }
  activate_policies_for_service = ["OKE"]
  tenancy_ocid                  = var.tenancy_ocid
  policy_compartment_ocid       = var.compartment_ocid
  random_id                     = "${random_id.tag.hex}"
  region_name                   = var.region
  defined_tags                  = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

