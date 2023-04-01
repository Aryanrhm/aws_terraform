## AWS Terraform Modules
This repository contains a collection of Terraform modules for provisioning AWS resources. Each module is designed to be reusable and customizable, providing a quick and easy way to deploy infrastructure on AWS.

### Modules
The following modules are currently included in this repository:

* Services
  * EC2 instance
  * AMI from Instance
  * AutoScaling Group
  * Elastic IP
  * IAM Role
  * Key Pairs
  * Load Balancer
  * Placement Group
  * Security Group
  * CloudFront
* Databases
  * RDS database
  * ElastiCache
* Storages
  * EBS Snapshot
  * EBS Volume
  * EFS
  * EFS Mount
  * S3



### Usage
To use one of the modules in your Terraform configuration, simply include it as a module in your Terraform code. For example:

```
module "ec2_instance" {
  source = "git::https://github.com/Aryanrhm/aws-terraform-modules.git//services/ec2_instance"

  // Specify input variables here
}
```

Be sure to replace //ec2_instance with the appropriate path to the module you want to use.



### Contributing
If you would like to contribute to this repository, please fork the repository and submit a pull request with your changes. Be sure to follow the existing coding conventions and standards.

### Credits
These modules were created by Aryan Rahimi. Contributions and suggestions are welcome.

### Contact
If you have any questions or comments about these modules, please feel free to contact me at ary.rahimi@gmail.com .
