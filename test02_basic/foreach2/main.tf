# terraform_example/test02_basic/foreach/main.tf
# local_file.students_notes is map type
# for_each can be set type or map type

locals {
  students = {
    chihiro = "chihiro s"
    junhan = "junhan s"
    shinichiro = "shinichiro junichiro"
  }
}

resource "local_file" "student_notes" {
    for_each = local.students
    filename = "${path.module}/student_${each.key}.txt"
    content = "Hello! This is the noe of ${each.value}"
}

output "debug" {
    description = "all contents that were created"
    value = [for item in local_file.student_notes : item.filename]
}