variable "message" {
  type = string
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo ${var.message}"
  }
}
