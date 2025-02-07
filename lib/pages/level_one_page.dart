import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'level_two_page.dart'; // นำเข้า LevelTwoPage

class LevelOnePage extends StatelessWidget {
  const LevelOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    void validateCode() {
      String inputCode = codeController.text;
      if (inputCode == '4365') {
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
                  MaterialPageRoute(builder: (context) => const LevelTwoPage()),
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
        title: const Text('ด่านที่ 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ให้ไปในห้องเก็บของที่อยู่ชั้น 2 ให้หารูปทรงต่างๆ 4 รูปทรง แล้วทำการหารหัส เมื่อเคลียร์ด่านแล้วให้ทำการเก็บไพ่ UNO ไว้',
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
          ],
        ),
      ),
    );
  }
}
