resource "local_file" "files" {
  for_each = var.fileinfo
  content  = each.value.content
  filename = each.value.name
}