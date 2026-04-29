# terraform_exaample/test02_basic/count/main.tf

resource "local_file" "student_notes" {
    count = 3
    filename = "${path.module}/student_${count.index + 1}.txt"
    content = "Hello! This is the ${count.index + 1}th student practice notes."
}

output "debug0" {
    value = local_file.student_notes[0].filename
}

output "debug1" {
    value = local_file.student_notes[1].filename
}

output "debug2" {
    value = local_file.student_notes[2].filename
}

output "debug_all" {
    value = local_file.student_notes[*].filename
}