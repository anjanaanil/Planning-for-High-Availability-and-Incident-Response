# Infrastructure

## AWS Zones
Identify your zones here:
 - Region : us-east-2 
    - Zones:
        - us-east-2a
        - us-east-2b
        - us-east-2c
- Region : us-west-1
    - Zones:
        - us-west-1a
        - us-west-1c

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| AWS Cloud Environment | Amazon web console for infrastructure creation | - | 1 | cloud environment |
| AWS credentials | Access Key ID and Access Secret key for Amazon web console | - | 1 | Authorization required to access |  |
| GitHub repo | contains terraform code (Infrastructure automation (IaaC)) | - | 1 | Github Repository is public.|
| S3 bucket | Used to store terraform state files of the infrastructure | S3 bucket | 2 | Stored in a shared location. 2 Buckets for each region|
| EC2 Ubuntu-Web Instance | A web server to deploy flask application | t3.micro | 6 | The application is running on 3 instances. Multi AZ. |
| Application Load Balancer | ALB for traffic distribution between EC2 instances | - | 1 | Multi AZ. |
| VPC | Virtual Private Network for EC2 instances and EKS clusters in both the regions | - | 2 | Multi AZ.  |
| Custom Ubuntu image | Image of Flask web application | - | 2 | Image available in both regions |
| udacity-cluster | Kubernetes cluster for monitoring stack | t3.medium | 2 | 1 cluster each in us-east-2 and us-west-1 |
| udacity-cluster nodes | nodes in Kubernetes cluster for monitoring stack | t3.medium | 4 | 2 instances in Multi AZ. us-east-2 and us-west-1 |
| RDS cluster for Ubuntu-web | Aurora MySQL database cluster is used by web service | Aurora MySQL | 2 | Primary RDS is running on 2 instances in us-east-2 region and replicates to secondary RDS that is running on 2 instances in us-west-1 region. Both RDS has a 5 day backup window. |
| RDS Cluster Instance | used to store application data | db.t2.small | 4 | Primary RDS is running on 2 instances in us-east-2 region and replicates to secondary RDS that is running on 2 instances in us-west-1 region. Both RDS has a 5 day backup window. |
| Prometheus and Grafana | used for monitoring and alerting | - | 1 | Installation done |
| SSH keys | Used to get access to EC2 instances | - | 1 | Shall be stored securely. |



### Descriptions
More detailed descriptions of each asset identified above.
- Amazon Machine Image (AMI): virtual machine images stored in AWS
- Availability zones (AZ):this refers to localized zones for each region. A region may have 3 availability zones that are spaced maybe 50 miles apart.
- Cluster: a generic term used to describe a group of servers or services working together to provide a service to spread the node among nodes and provide availability if one fails.
- Infrastructure as Code (IaC): a method for deploying infrastructure or changes to a provider either on-prem or cloud where all resources are defined via code.
- Load balancer: hardware or virtual appliance or software that performs traffic direction to many backend services. Load balancers are generally the entry points for resources as they can direct and balance all requests to many backend services.
- EC2: the AWS service that runs and manages virtual machines running in the AWS cloud.
- S3 bucket:Amazon S3 is an object storage service that stores data as objects within buckets. An object is a file and any metadata that describes the file. A bucket is a container for objects
- RDS Cluster : s a distributed relational database service by Amazon Web Services
- Instance : a generic term referring to a virtual machine, a database node, or any type of resource that provides a service.
- SSH : refers to a key that is used to authenticate to a server to perform administrative tasks on the server. 
- Prometheus : an industry-standard tool for collecting and querying metrics.
- Grafana: an industry-standard tool for visualizing metrics in graph format.
- VPC (virtual private cloud): an AWS term referring to the network setup in a particular region for your infrastructure. 

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
- Ensure the AMI image for the flask application is available
- Create 2 S3 Buckets in 2 regions to store terraform state
- Ensure infrastructure is set up and working in the DR site


## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

1. Create a cloud load balancer and point DNS to the load balancer. This way you can have multiple instances behind 1 IP in a region. During a failover scenario, fail over the single DNS entry at your DNS provider to point to the DR site. 
2. Have a replicated database and perform a failover on the database. 