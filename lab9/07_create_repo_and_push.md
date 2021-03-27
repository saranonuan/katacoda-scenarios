ให้ทำการสร้าง GitHub Code Repository สำหรับเก็บ Code ใน Lab นี้
โดยให้ตั้งชื่อว่า **sdte-lab9**

![example](/saranonuan/scenarios/lab9/assets/create_repo.png)

เมื่อสร้าง Repo เสร็จแล้ว

ไปที่เมนู Settings > Secrets โดยให้เพิ่ม Secrets สองค่าดังนี้

1. **AWS_ACCESS_KEY_ID** โดย value เป็น AWS Access Key
2. **AWS_SECRET_ACCESS_KEY**  โดย value เป็น AWS Secret Key

Secret นี้ใช้เพื่อไว้ในการแทนค่าในไฟล์ .github/workflows/build.yml ที่สร้างด้านบน สำหรับให้ AWS CLI ใน Actions ทำงานได้

![example](/saranonuan/scenarios/lab9/assets/config_git_secret_example.png)

เมื่อตั้งค่าเรียบร้อยแล้วให้ทำการ Commit และ Push ขึ้น Github

![example](/saranonuan/scenarios/lab9/assets/git_push_example.png)

เมื่อ Push Code ขึ้นไปแล้ว
Github Action จะถูก Trigger เพื่อทำการ Build Docker Image แล้วเก็บ Image บน ECR

โดยในขั้นตอนนี้ Github Actions ต้องสำเร็จเป็นสีเขียว
และใน AWS Console ไปที่เมนูของ ECR เพื่อดูว่ามีการ Build docker image และจัดเก็บเข้ามาไว้ใน ECR เรียบร้อยแล้วหรือไม่

<span style="color:red">ตัวอย่างผลลัพธ์</span>

![example](/saranonuan/scenarios/lab9/assets/github_action_result.png)

![example](/saranonuan/scenarios/lab9/assets/ecr_result.png)

<span style="color:red">Capture ให้เห็นการทำงาน GitHub Actions ที่สำเร็จ ลงใน LabSheet (A)</span>
