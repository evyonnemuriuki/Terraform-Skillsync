resource "aws_iam_role" "server_role" {
  name               = "skillsync_server_role"
  #The <<EOF initiates the here document, and the final EOF indicates its end.
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
    "Effect": "Allow",
    "Sid": ""
    }
  ]
}
EOF
  tags = {
    Name  = "server_role",
    Owner = "skillsync"
  }
}

resource "aws_iam_instance_profile" "server_profile" {
  name = "server_profile"
  role = aws_iam_role.server_role.name
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.server_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}