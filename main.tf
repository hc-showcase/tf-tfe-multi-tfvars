variable "message" {
  type = string
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo  ${var.message}"
  }
}

resource "null_resource" "test2" {
  provisioner "local-exec" {
    command = "echo  ${var.message}"
  }
}
