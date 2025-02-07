import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'level_three_page.dart'; // นำเข้า LevelThreePage

class LevelTwoPage extends StatelessWidget {
  const LevelTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    void validateCode() {
      String inputCode = codeController.text;
      if (inputCode == '1107') {
        Alert(
          context: context,
          type: AlertType.success,
          title: "ผ่านด่านแล้ว",
          buttons: [
            DialogButton(
              child: const Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LevelThreePage()),
                );
              },
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "รหัสไม่ถูกต้อง",
          buttons: [
            DialogButton(
              child: const Text(
                "ลองใหม่",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ).show();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ด่านที่ 2'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "\"ย้อนช่วง 'เวลา' ไปยังจุดเริ่มต้นกันดีกว่า คำใบ้ก็คือ ? \" \n\n"
              "โดยคำใบ้นั้นอยู่ใต้โต๊ะทำงานในห้องนอน \n\n"
              "เมื่อหาคำใบ้เจอแล้วให้อ่านข้อความดังกล่าวอีกรอบจากนั้นก็มาอ่านคำใบ้ \n"
              "แล้วทำการกรอกรหัส 4 หลัก",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกรหัส 4 หลัก',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateCode,
              child: const Text('ยืนยันรหัส'),
            ),
            const Text(
              "เมื่อเคลียร์ด่านแล้วให้ไปเก็บไพ่ UNO โดยจะอยู่กับตุ๊กตาบนหัวที่นอน ให้หาเอานะจ๊ะ ^_^",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
