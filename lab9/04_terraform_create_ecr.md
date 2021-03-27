# สร้าง Web อย่างง่ายด้วย Express.js และทำเป็น Docker image เก็บบน AWS ECR

รันคำสั่ง เพื่อสร้าง AWS S3 ไว้สำหรับเก็บ Terraform State
<span style="color: red;">เปลี่ยนรหัสนักศึกษา เป็นเลขรหัสนักศึกษาด้วย</span>
`aws s3api create-bucket --bucket lab9-รหัสนักศึกษา --region us-east-1`

สร้างไฟล์ terraform.tf เพื่อตั้งค่า backend สำหรับเก็บ Terraform State ไปไว้ที่ aws s3
<span style="color: red;">เปลี่ยนรหัสนักศึกษา เป็นเลขรหัสนักศึกษาด้วย</span>
<pre class="file" data-filename="terraform.tf" data-target="replace"># terraform.tf
terraform {
 backend "s3" {
    encrypt = true
    bucket = "lab9-รหัสนักศึกษา"
    region = "ap-southeast-1"
    key = "infra-state"
 }
}
</pre>

<hr />

ในไฟล์ infra.tf เพื่อระบุ Provider ที่จะใช้งาน Terraform ด้วย ว่าเป็น AWSที่ Singapore

<pre class="file" data-filename="infra.tf" data-target="replace"># Target Provider is AWS at region ap-southeast-1 (Singapore)
provider "aws" {
  region  = "ap-southeast-1"
}
</pre>

เพิ่มในไฟล์ infra.tf เพื่อสร้าง AWS ECR สำหรับไว้เก็บ Docker Image แบบ Private ชื่อว่า "lab9_image_repo"

<pre class="file" data-filename="infra.tf" data-target="append"># ECR
resource "aws_ecr_repository" "lab9_image_repo" {
  name = "lab9_image_repo"
}
</pre>

สั่ง `terraform init`{{execute}} เพื่อเตรียม terraform

สั่ง `terraform apply`{{execute}} เพื่อให้ terraform ช่วยสร้างรายการต่างๆตามที่ระบุ

รอ Terraform ดำเนินการสร้าง Infrastructure ต่างๆให้
<span style="color: blue;">หากพบปัญหาที่เกี่ยวข้องกับ Internet สามารถรัน `terraform apply` เพื่อลองใหม่ได้</span>

รอ Terraform apply
เสร็จแล้วจึงไปขั้นตอนต่อไป
