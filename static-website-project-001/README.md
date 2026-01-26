# Project steps
1. Deploy a VPC and a subnet
2. Deploy an internet gateway and associate with the VPC - This enables communication to internet
3. Setup a route table with a route to internet gateway(IGW) - This helps to guide where network traffic from subnet or gateway is directed
4. Deploy EC2 instance inside the subnet
5. Assiciate a public IP and a security group that allows public ingress
6. Chnage the EC2 instance to use a publicly available NGINX AMI 
   [To check how terraform behave when AMI is changed]
   [It will replace instead of inplace change]


## Plan
1. Create a VPC with a CIDR block
2. Create a subnet in VPC
3. Create a internet gateway in VPC
4. Create a route table in VPC 
   and add a route with destination as 0.0.0.0/0 (represents all internet traffic) 
   and target it to igw
5. Associate route table with subnet