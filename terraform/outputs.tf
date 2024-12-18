output "public_ip" {
  value = module.vm.public_ip
  description = "The public IP address of the VM"
}