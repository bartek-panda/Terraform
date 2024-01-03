[aws]
${ansible_ip}


[aws:vars]
anisble_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/panda_kurs
ansible_ssh_common_args="-o StrictHostKeyChecking=no"