# สร้าง Web อย่างง่ายด้วย Express.js และทำเป็น Docker image เก็บบน AWS ECR

สร้างไฟล์​ src/package.json

<pre class="file" data-filename="src/package.json" data-target="append">{
  "name": "node-docker-ecs",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.17.1"
  }
}
</pre>

สร้างไฟล์ src/index.js และเขียนสร้าง Web Server ด้วย Express อย่างง่าย โดยจะ Return "Hello World!" เมื่อมีการ request เข้ามา
<pre class="file" data-filename="src/index.js" data-target="replace">const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, "0.0.0.0", () => console.log(`Web app listening on port ${port}!`))

</pre>

สร้างไฟล์ src/Dockerfile เพื่อทำ WebApp เราให้เป็น Docker image เพื่อนำไป Deploy ต่อ

<pre class="file" data-filename="src/Dockerfile" data-target="replace"># Use an official Node 12.7.0 runtime as a parent image
FROM node:12.7.0-alpine

# Set the working directory to /app
WORKDIR '/app'

# Copy package.json to the working directory
COPY package.json .

# Install any needed packages specified in package.json
RUN yarn

# Copying the rest of the code to the working directory
COPY index.js .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run index.js when the container launches
CMD ["node", "index.js"]

</pre>

ทดลองสร้าง Docker image
`cd /root/lab9/src`{{execute}}
`docker build -t lab9-webserver-express .`{{execute}}

ถ้า file และ Dockerfile ถูกต้อง จะ Build ผ่าน
เมื่อสร้าง Docker image ได้สำเร็จเรียบร้อยแล้ว
แสดงว่าเราก็จะมี ExpressJS Server ที่พร้อมสำหรับทำเป็น Docker Image เพื่อใช้ใน CI ต่อไปแล้ว

กลับไป folder หลักก่อนที่จะดำเนินการต่อ
`cd /root/lab9`{{execute}}
