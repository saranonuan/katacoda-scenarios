# ปรับ GitHub Actions เพิ่มความสามารถในการ Continues Deployment
# ให้ Auto Deploy to ECS เมื่อ Push Image เรียบร้อยแล้ว

แก้ไขไฟล์ src/index.js ให้ Return ต่างไปจากเดิม
<pre class="file" data-filename="src/index.js" data-target="replace">const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Lab 9 Done !!'))

app.listen(port, "0.0.0.0", () => console.log(`Web app listening on port ${port}!`))

</pre>


แก้ไขไฟล์ .github/workflows/build.yml ให้ Deploy to ECS ต่อทันทีเลยเมื่อ Build & Push Image เสร็จเรียบร้อยแล้ว
โดยใช้ Image ล่าสุดที่พึ่ง Build เสร็จ ในการ Deploy version ใหม่

<pre class="file" data-filename=".github/workflows/build.yml" data-target="replace">name: Build docker image and push to ECR

on:
  push:
    branches:
      - "main"
      - "master"

jobs:
  build-docker:
    name: Build docker image from source
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
      - name: Build, tag, and push image to Amazon ECR
        id: build-image
        env:
          ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
          ECR_REPOSITORY: lab9_image_repo
          IMAGE_TAG: ${{ github.sha }}
        run: |
          docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG -f src/Dockerfile src
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
          docker tag $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG $ECR_REGISTRY/$ECR_REPOSITORY:latest
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:latest
          echo "::set-output name=image::$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG"

      - name: Download task definition that create from Terraform
        run: |
          aws ecs describe-task-definition --task-definition lab9-task --query taskDefinition > task-definition.json

      - name: Fill in the new image ID in the Amazon ECS task definition
        id: task-def
        uses: aws-actions/amazon-ecs-render-task-definition@v1
        with:
          task-definition: task-definition.json
          container-name: lab9-container
          image: ${{ steps.build-image.outputs.image }}

      - name: Deploy Amazon ECS task definition
        uses: aws-actions/amazon-ecs-deploy-task-definition@v1
        with:
          task-definition: ${{ steps.task-def.outputs.task-definition }}
          service: lab9-service
          cluster: lab9_cluster
          wait-for-service-stability: true

</pre>

<span style="color: yellow">ทำการ Commit และ Push</span>
