#test02_basic/count2/main.tf 

locals {
  students_list = ["chihiro", "junhan", "shinichiro"]
}

resource "local_file" "student_notes" {
    count = length(local.students_list)
    filename = "${path.module}/student_${local.students_list[count.index]}.txt"
    content = "Hello ${local.students_list[count.index]} student notes"
}

output "debug" {
    value = local_file.student_notes[*].filename
}