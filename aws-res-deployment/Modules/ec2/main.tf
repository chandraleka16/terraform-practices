resource "aws_instance" "main" {
    # count = var.ec2_count
    ami   = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    
    placement_group = var.placement_group
    tenancy = var.tenancy
    vpc_security_group_ids = var.vpc_sg_ids
    source_dest_check = var.source_dest_check
    user_data = var.user_data
    ebs_optimized = var.ebs_optimized
    host_id = var.host_id  
    hibernation = var.hibernation
    disable_api_termination = var.disable_api_termination
    key_name = var.key_pair_name
    monitoring = var.monitoring

    root_block_device {
        delete_on_termination = var.root_ebs_delete_on_termination
        encrypted             = var.root_ebs_encrypted
        iops                  = var.root_ebs_iops
        volume_size           = var.root_ebs_size
        volume_type           = var.root_ebs_type
    }
    tags = {
        Name = var.ec2_name
    }
}
