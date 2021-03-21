# สร้าง Code Repository และ Setup GitHub Actions สำหรับ Build Docker Image

สร้างไฟล์ .github/workflows/build.yml

<pre>
name: Build docker image and push to ECR

on:
  push:
    branches:
      - "main"

jobs:
  build-docker:
    name: Build docker image from source
    needs: check-code
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the repo
        uses: actions/checkout@v2
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ap-southeast-1
      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1
      - name: Build & Push to Docker Hub
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          tags: ECR_URL
          push: true

</pre>

**ตรง ECR_URL ให้เปลี่ยนเป็น ECR URL ที่ได้ในขั้นตอนที่ 4**
**หากจำไม่ได้ให้รัน `terraform output`{{execute}} เพื่อดูอีกครั้ง**

ให้ทำการสร้าง GitHub Code Repository สำหรับเก็บ Code ใน Lab นี้
โดยให้ตั้งชื่อว่า **sdte-lab9**

![example](/saranonuan/scenarios/lab9/assets/create_repo.png)

ทำการ Commit และ Push ขึ้น Github 

เมื่อ Push Code ขึ้นไปแล้ว
Github Action จะถูก Trigger ให้ทำการ Build Docker Image

โดยในขั้นตอนนี้ Github Actions ต้องสำเร็จเป็นสีเขียว
และใน AWS Console ไปที่เมนูของ ECR เพื่อดูว่ามีการ Build docker image และจัดเก็บเข้ามาไว้ใน ECR เรียบร้อยแล้วหรือไม่

![example](/saranonuan/scenarios/lab9/assets/github_action_result.png)

![example](/saranonuan/scenarios/lab9/assets/go_to_ecr.png)

![example](/saranonuan/scenarios/lab9/assets/ecr_result.png)


