import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'level_five_page.dart'; // เพิ่มหน้าด่านที่ 5

class LevelFourPage extends StatefulWidget {
  const LevelFourPage({super.key});

  @override
  State<LevelFourPage> createState() => _LevelFourPageState();
}

class _LevelFourPageState extends State<LevelFourPage> {
  final List<Color> availableColors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
  ];

  final List<Color?> selectedColors = [null, null, null]; // ช่องเลือกสี 3 ช่อง

  void validateColors() {
    if (selectedColors[0] == Colors.red &&
        selectedColors[1] == Colors.green &&
        selectedColors[2] == Colors.yellow) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "ผ่านด่านแล้ว",
        buttons: [
          DialogButton(
            child: const Text(
              "ไปต่อ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LevelFivePage()),
              );
            },
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "เลือกสีผิด",
        desc: "กรุณาลองใหม่อีกครั้ง",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ด่านที่ 4'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ไพ่ UNO ที่ได้เก็บมาทุกด่าน ได้เวลาใช้แล้ว!! \nคำใบ้คือ 456 อย่ารอช้าเลือกสีให้ถูกต้อง!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                selectedColors.length,
                (index) => DropdownButton<Color>(
                  value: selectedColors[index],
                  hint: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                  items: availableColors.map((color) {
                    return DropdownMenuItem<Color>(
                      value: color,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Color? newColor) {
                    setState(() {
                      selectedColors[index] = newColor;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateColors,
              child: const Text('ยืนยัน'),
            ),
          ],
        ),
      ),
    );
  }
}
