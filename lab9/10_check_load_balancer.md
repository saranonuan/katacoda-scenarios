# ทดลองเข้า App ที่ Deploy ขึ้น ECS ผ่าน Load Balancer

ใน AWS Console ไปที่ Service EC2

![example](/saranonuan/scenarios/lab9/assets/aws_menu_ec2.png)

เข้าเมนู Load Balancer

![example](/saranonuan/scenarios/lab9/assets/load_balancer_menu.png)

จะเห็น Load Balancer ที่สร้างด้วย Terraform

ลองเข้าด้วย DNS name ของ Load Balancer

![example](/saranonuan/scenarios/lab9/assets/load_balancer_dns.png)

ถ้าทำถูกต้อง จะได้หน้า Hello World ที่ตอบกลับมาจากโปรแกรมที่ทำ

![example](/saranonuan/scenarios/lab9/assets/load_balancer_output_example.png)

<span style="color:red">Capture หน้าเว็บไซต์ให้เห็น URL ที่ทำด้วย ลงใน LabSheet</span>
