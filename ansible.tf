# wylowywanie kodu na LOKALNEJ MASZYNCE
resource "null_resource" "download_ssh_key" {
  triggers = {
    timestamp = "${replace("${timestamp()}", "/[-| |T|Z|:]/", "")}"
  }
 # sciaganie komenda shelowa klucza SSH na maszynke gdzie hcodzi terraform(na ktorej pracuje)
  provisioner "local-exec" {
    command = "mkdir -p ~/.ssh/ &&  aws s3 cp s3://${var.bucket_name}/panda_kurs.pem ~/.ssh/panda_kurs.pem || true && chmod 400 ~/.ssh/panda_kurs.pem"
  }
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