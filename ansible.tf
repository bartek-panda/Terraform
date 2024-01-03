# wylowywanie kodu na LOKALNEJ MASZYNCE
resource "null_resource" "download_ssh_key" {
  # trigerujemy date(ktora za kazdym razem jest inna) aby aby komenda odpalala sie za kazdym razem gdy robimy toeerafrm apply
  triggers = {
    timestamp = "${replace("${timestamp()}", "/[-| |T|Z|:]/", "")}"
  }
  # sciaganie komenda shelowa klucza SSH na maszynke gdzie hcodzi terraform(na ktorej pracuje)
  provisioner "local-exec" {
    command = "mkdir -p ~/.ssh/ &&  aws s3 cp s3://${var.bucket_name}/panda_kurs.pem ~/.ssh/panda_kurs.pem || true && chmod 400 ~/.ssh/panda_kurs.pem"
  }
}


resource "local_file" "ansible_inventory" {
    #path.module - obecny folder
  #path.cwd - sciezka absolutna
  content = templatefile("inventory.tpl", 
                        { ansible_ip = "${join("\n", aws_instance.panda.*.public_ip)}" })
  filename = "${path.module}/../inventory"
}




# wywpluwanie komendy na maszynce awsowej
# resource "aws_instance" "example" {
#     provisioner "local_exec" {
#         command = "echo ${self.private_ip} >> private_ips.txt"
#          work_dir = ""
#          when = ""
#          environment = {

#            FOO = "bar"
#            BAR = 1
#            BAZ = true
#        }
#     }
# }