resource "aws_instance" "web" {
    count = var.instance_count
    instance_type = var.instance_type
    ami = var.ami_id
    subnet_id = var.subnet_id

    tags = {
        Name = "web"
    }
}