import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // ใช้ Lottie สำหรับแอนิเมชัน

class LevelFivePage extends StatelessWidget {
  const LevelFivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผ่านทุกด่านแล้ว'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          // แอนิเมชันพลุดอกไม้ไฟ
          Lottie.asset(
            'assets/fireworks.json',
            fit: BoxFit.cover,
            repeat: true, // แอนิเมชันวนซ้ำ
            width: double.infinity,
            height: double.infinity,
          ),
          // ข้อความ Foreground
          const Center(
            child: Text(
              'ยินดีด้วย! คุณผ่านด่านแล้ว \nของขวัญวันเกิดอยู่ในตู้เสื้อผ้า \nรีบหาเลยอย่ารอช้า!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // color: Colors.white, // ข้อความสีขาวเพื่อให้เห็นชัดเจนบนพื้นหลัง
              ),
            ),
          ),
        ],
      ),
    );
  }
}
