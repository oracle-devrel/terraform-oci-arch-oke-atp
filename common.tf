## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


locals {
  defined_tags = module.policies.predefined_tags
  # declare a local for defined tags to conceal from the rest of the module how we're creating them
}
module "policies" {
  source = "../terraform-oci-arch-policies"
  #source                        = "github.com/oracle-devrel/terraform-oci-arch-policies"
  activate_policies_for_service = ["OKE"]
  tenancy_ocid                  = var.tenancy_ocid
  compartment_ocid              = var.compartment_ocid
  region_name                   = var.region
  tag_namespace                 = "deploy-oke-with-atp-in-oci"
  release                       = var.release
}

