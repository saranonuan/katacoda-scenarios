# สร้าง Web อย่างง่ายด้วย Express.js และทำเป็น Docker image เก็บบน AWS ECR

เพิ่มในไฟล์ infra.tf เพื่อระบุ Provider เป็น AWS
<pre class="file" data-filename="infra.tf" data-target="append"># Target Provider is AWS at region ap-southeast-1 (Singapore)
provider "aws" {
  region  = "ap-southeast-1"
}

</pre>

เพิ่มในไฟล์ infra.tf เพื่อระบุให้สร้าง AWS ECR สำหรับไว้เก็บ Docker Image แบบ Private ชื่อว่า "lab9_image_repo"
<pre class="file" data-filename="infra.tf" data-target="append"># ECR
resource "aws_ecr_repository" "lab9_image_repo" {
  name = "lab9_image_repo"
}

</pre>

ระบุ Output ที่ต้องการจาก Terraform

เป็น URL ของ Image Repository บน ECR
<pre class="file" data-filename="output.tf" data-target="append">output "lab9_image_repo_url" {
  value = aws_ecr_repository.lab9_image_repo.repository_url
}

</pre>

สั่ง `terraform init`{{execute}} เพื่อสร้าง terraform workspace
สั่ง `terraform apply`{{execute}} เพื่อให้ terraform ช่วยสร้างตามที่ระบุ

เมื่อ Terraform apply เสร็จแล้ว

ให้รัน
`terraform output`{{execute}}
เพื่อดูว่า URL ของ Image Repository คืออะไร เพื่อนำไปใช้ต่อในในขั้นตอนต่อไป
