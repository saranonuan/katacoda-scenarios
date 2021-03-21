## เตรียม AWS Account

1. สร้าง AWS Account https://portal.aws.amazon.com/billing/signup#/start
2. Login
3. เปลี่ยน Region เป็น Singapore 

![example](/saranonuan/scenarios/lab9/assets/change_to_singapore.png)


4. เข้า My Security Credentials 

![example](/saranonuan/scenarios/lab9/assets/go_to_my_security_credentials.png)

5. สร้าง Access Key, จดบันทึกไว้ในที่ปลอดภัย

![example](/saranonuan/scenarios/lab9/assets/create_aws_cli_button.png)

![example](/saranonuan/scenarios/lab9/assets/create_aws_cli_key.png)


## ตั้งค่า AWS CLI
1. รันคำสั่ง `aws configure`{{execute}}
2. กรอก Access Key กับ Secret Key ที่ได้มาก่อนหน้านี้, ระบุ Default Region เป็น "ap-southeast-1" (กรอกแค่ ap-southeast-1 ไม่ต้องมี "), Default output ไม่ต้องกรอกอะไรปล่อยว่างได้
