import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'level_four_page.dart';

class LevelThreePage extends StatelessWidget {
  const LevelThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    void validateCode() {
      String inputCode = codeController.text;
      if (inputCode == '6435') {
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
                      builder: (context) => const LevelFourPage()),
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
        title: const Text('ด่านที่ 3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundedBox(Colors.red),
                _buildRoundedBox(Colors.blue),
                _buildRoundedBox(Colors.green),
                _buildRoundedBox(Colors.yellow),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 35), // ปรับระยะห่างจากด้านบน
              child: const Text(
                "คำใบ้อยู่ในมือ อย่ารอช้า กรอกรหัสเลย!!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
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
            Container(
              margin: const EdgeInsets.only(top: 10), // ปรับระยะห่างจากด้านบน
              child: const Text(
                "หลังจากเคลียร์รหัสแล้วให้ทำการหาไพ่ UNO โดยจะอยู่หลังกรอบรูปที่มีรูปปั้นพระสีขาวๆ ว่าแต่ที่ไหนกันนะ ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedBox(Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
    );
  }
}
