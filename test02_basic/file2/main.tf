resource "local_file" "ansible_config" {
    filename = "${path.module}/ansible.cfg"
    content = <<-EOF
        [defaults]
        inventory = ./inventory.yml
        host_key_checking = False
    EOF
}

output "debug" {
    value = "ansible setup file ${local_file.ansible_config.filename} complete"
}