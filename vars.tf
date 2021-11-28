variable "aws_access_key" {
  default = "i am not giving you my access key"
}
variable "aws_secret_key" {
  default = "neither my secret key"
}
variable "aws_region" {
  default = "hey get your own aws account"
}
variable "AMIS"{
  type = map
  default = {
    us-east-1="ami-1kqjefgkfazr354af"
    us-east-2="ami-0dd0ccab7e2801812"
    us-east-3="ami-akhrgaikg63574fq54"
    us-east-4="ami-ajzrhaojn8374ed"
  }
}