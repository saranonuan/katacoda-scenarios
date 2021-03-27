# สร้าง Code Repository และ Setup GitHub Actions สำหรับ Build Docker Image

กลับไป folder หลักก่อนที่จะดำเนินการต่อ
`cd /root/lab9`{{execute}}

สร้างไฟล์ .gitignore
เพื่อไม่ให้โฟลเดอร์ .terraform ถูกนำขึ้นไปเก็บด้วย เพราะมีขนาดใหญ่เกินไป

<pre class="file" data-filename=".gitignore" data-target="append">
.terraform
</pre>

สร้างไฟล์ .github/workflows/build.yml
เพื่อสร้าง GitHub Build Pipeline สำหรับทำ CI Docker Image

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

</pre>
