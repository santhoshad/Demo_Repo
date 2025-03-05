provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaavc76ja77ynos2lfgdfwbbten7l25irg2wpm4asuyighwsbsdyj6a"
  user_ocid        = "ocid1.user.oc1..aaaaaaaavssuviqqkbmb5ybdchn3gdap4u65jhy4xdaik2w6uao2oh5qmexq"
  fingerprint      = "ea:cf:6e:0e:ca:89:c5:ff:6d:2d:73:b1:03:82:fd:34"
  private_key_path = "C:\Users\User\.oci"
  region           = "ap-mumbai-1" 
}

resource "oci_core_instance" "my_instance" {
  availability_domain = "ocid1.domain.oc1..aaaaaaaa2u2k4e3adjlfch5sfwsrm6urvsabobealdlvja7sf5safscwv72q"
  compartment_id      = "ocid1.tenancy.oc1..aaaaaaaavc76ja77ynos2lfgdfwbbten7l25irg2wpm4asuyighwsbsdyj6a"
  shape               = "VM.Standard.E2.1.Micro" 

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaagv7vsa3ilkmvvfcb4a5kjqeom2dyg4fosk7dagnbke5bit5utn3a"
  }

  display_name = "Terraform-OCI-Instance"

  create_vnic_details {
    subnet_id = "ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaan3q2vpgrmgctax463gnifam6zorczqwxb4bhzghmar27hg62dsda"
  }

  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDd7g6YguYZOvoArLYmnltRpohaIGlvEJOf3krVAE5Vilm9iRbvMaPHnurwDe4ispUrnL527M9Y+wlgZB5XC7ETmRKalyMIJcfeuRu0grI3q35iOxE+Ez6meJJ/XU+VPDZEjs3pB3UIRCPzEo7LNxzwTtfA4KyZ7JWt6W1eeRCTz835IbSI4Rnb4j4FX+gVQHT95coE7CSWQuacDH7EDVpikj2K1rr8z4WedGJLdgljqY0WPjbfgz0Pu2+KSbGMvdvK55Wo3kieMLfB6Y6PVf+v5pBc7DvpIsWpFb64jIjLw/M3UOgW36SSuMBQFN0/C0KhHMhPxF4czKPgnzYJK7fG99GYpxoj+geZAEOaBSqUkeQ4YwLx7VSeQ3fKGFzxzLl60Gs/nCiwxayzpUj0xbfCb7gnOrPf94VJLB5iAI6nVdrxIMrO5B5KR13vmzTSZd0K/qUIw6DOo0BEkRrTqPaQ4IaWn1RZs6JQMcdiOldtymCGJ+FDZDNEP7r9g/IGGM88aXk4xCWvIgI/dtXDBrEvK/uCc/kUJ6UGSUBcGthq8iNL+jW3YNGLfiHyMN6OLJ9FytgjO+n1fibm5bPPPN8jBAF07xxgFabTnl7KGwYgiP67kcaUDFIy2O3k4pqytuGWfDpBHnonkMsmRVf/Qd5qw31qxR1HOg7cMfGhP1aS0w"
  }
}

output "instance_public_ip" {
  value = oci_core_instance.my_instance.public_ip
}
