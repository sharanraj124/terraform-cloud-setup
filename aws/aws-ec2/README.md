# Terraform Project Structure

This is a Terraform project for managing AWS resources. The project is organized into several modules to maintain a clean and reusable infrastructure setup.

## Project Directory Structure

├── backend.tf ├── main.tf ├── modules │ ├── dynamodb │ │ ├── main.tf │ │ └── variables.tf │ ├── ec2 │ │ ├── main.tf │ │ ├── outputs.tf │ │ └── variables.tf │ ├── internet_gateway │ │ ├── main.tf │ │ ├── outputs.tf │ │ └── variables.tf │ ├── key_pair │ │ ├── main.tf │ │ └── variables.tf │ ├── route_table │ │ ├── main.tf │ │ └── variables.tf │ ├── s3_bucket │ │ ├── main.tf │ │ └── variables.tf │ ├── security_group │ │ ├── main.tf │ │ ├── outputs.tf │ │ └── variables.tf │ ├── subnet │ │ ├── main.tf │ │ ├── outputs.tf │ │ └── variables.tf │ └── vpc │ ├── main.tf │ ├── outputs.tf │ └── variables.tf ├── outputs.tf ├── providers.tf ├── terraform.tfstate ├── terraform.tfstate.backup └── variables.tf


## Description of Files and Directories

### Root Files
- **`backend.tf`**: Configures the backend where the Terraform state file will be stored, typically in a remote location (like S3).
- **`main.tf`**: The main configuration file that orchestrates the usage of different modules and resources.
- **`outputs.tf`**: Contains the outputs for the root module, which are values you want to export from the main Terraform execution.
- **`providers.tf`**: Contains provider configurations for Terraform. This is where you define the provider(s) such as AWS, Azure, etc.
- **`variables.tf`**: Defines the input variables for the root module, such as region, AMI, or instance type. These are the values you can set from the command line or a `terraform.tfvars` file.
- **`terraform.tfstate`**: The state file where Terraform stores the current state of your infrastructure.
- **`terraform.tfstate.backup`**: A backup of the previous state file to restore in case something goes wrong.

### Modules
Each subdirectory inside the `modules/` folder contains a specific resource module that defines the resources and variables related to a particular AWS service. The modules are reusable, and you can reference them from the root configuration.

#### 1. **`modules/dynamodb`**:
   - **`main.tf`**: Contains the DynamoDB table configuration.
   - **`variables.tf`**: Defines the input variables for DynamoDB (e.g., table name, primary key).

#### 2. **`modules/ec2`**:
   - **`main.tf`**: Defines the EC2 instance and related resources (e.g., AMI, instance type).
   - **`outputs.tf`**: Exports values like instance ID, public IP, etc., for use in the root module.
   - **`variables.tf`**: Input variables for EC2 configuration (e.g., instance type, AMI ID).

#### 3. **`modules/internet_gateway`**:
   - **`main.tf`**: Contains the configuration for an AWS Internet Gateway.
   - **`outputs.tf`**: Exports the gateway ID for use in other modules.
   - **`variables.tf`**: Defines input variables (e.g., VPC ID).

#### 4. **`modules/key_pair`**:
   - **`main.tf`**: Defines the SSH key pair resource for EC2 access.
   - **`variables.tf`**: Input variables for the key pair name.

#### 5. **`modules/route_table`**:
   - **`main.tf`**: Contains configuration for the route table and associated routes.
   - **`variables.tf`**: Defines input variables for VPC ID, subnet ID, and gateway ID.

#### 6. **`modules/s3_bucket`**:
   - **`main.tf`**: Contains the configuration for creating an S3 bucket.
   - **`variables.tf`**: Input variables for S3 bucket configuration (e.g., bucket name, region).

#### 7. **`modules/security_group`**:
   - **`main.tf`**: Defines the security group and rules for EC2 instances.
   - **`outputs.tf`**: Exports the security group ID.
   - **`variables.tf`**: Input variables for security group configuration (e.g., VPC ID, CIDR blocks).

#### 8. **`modules/subnet`**:
   - **`main.tf`**: Contains subnet configuration within a VPC.
   - **`outputs.tf`**: Exports the subnet ID.
   - **`variables.tf`**: Defines input variables for the subnet (e.g., CIDR block, availability zone).

#### 9. **`modules/vpc`**:
   - **`main.tf`**: Contains the VPC, subnet, and related resources.
   - **`outputs.tf`**: Exports the VPC ID and subnet IDs.
   - **`variables.tf`**: Defines variables like CIDR block, availability zone, etc.

## How to Use This Structure

1. **Define Resources in Modules**:
   - Each module is responsible for creating a specific set of resources. For example, the `vpc` module creates the VPC, subnets, and related resources, while the `ec2` module manages EC2 instances.

2. **Pass Variables from Root Module**:
   - In the root `main.tf` file, you pass variables to the modules to configure them. Each module has its own `variables.tf` that defines the expected inputs.

3. **Reference Outputs in Root Module**:
   - Outputs from the modules (like `public_ip` from the `ec2` module or `vpc_id` from the `vpc` module) can be used in other parts of the root module or for further processing.

## Conclusion

This Terraform project structure is organized for maintainability and scalability. It modularizes the infrastructure components into reusable modules and allows for clear separation of concerns. With this structure, you can easily manage your AWS resources and modify configurations with minimal impact on other resources.


## Execute Terraform Commands

```bash
terraform init

terraform plan

terraform apply
```
