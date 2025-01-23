import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlinedb_peemmawaj/addproduct.dart';
import 'package:onlinedb_peemmawaj/showproduct.dart';
import 'package:onlinedb_peemmawaj/showproducttype.dart';
import 'addproduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAdKhsox85igDNvWAI5h-ZfHJEhFAeBrEQ",
            authDomain: "onlinefirebase-f6539.firebaseapp.com",
            databaseURL:
                "https://onlinefirebase-f6539-default-rtdb.firebaseio.com",
            projectId: "onlinefirebase-f6539",
            storageBucket: "onlinefirebase-f6539.firebasestorage.app",
            messagingSenderId: "233979467819",
            appId: "1:233979467819:web:f428f10381588265b5b26e",
            measurementId: "G-CF34K322D8"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}
 
// Class stateful เรียกใช้การทำงานแบบโต้ตอบ
class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<Main> {
  // ส่วนเขียน Code ภาษา Dart เพื่อรับค่าจากหน้าจอมา และส่งค่ากลับไป
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เมนูหลัก',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(  
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // เพิ่มการเว้นระยะ
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // เพิ่มโลโก้ที่นี่
                Image.asset(
                  'assets/logo.png',  // ปรับให้ตรงกับพาธที่เก็บโลโก้ของคุณ
                  width: 200,  // ขนาดของโลโก้
                  height: 200, // ขนาดของโลโก้
                ),
                SizedBox(height: 5), // เว้นที่ว่างด้านล่างโลโก้
                
                SizedBox(height: 100), // เว้นที่ว่างด้านบน
               
                SizedBox(height: 50), // เว้นที่ว่างหลังข้อความ
 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => addproduct()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 217, 219, 74),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // มุมปุ่มโค้ง
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('บันทึกข้อมูลสินค้า'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowProduct()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 217, 219, 74),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // มุมปุ่มโค้ง
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('แสดงข้อมูลสินค้า'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowProductType()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 217, 219, 74),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // มุมปุ่มโค้ง
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('ประเภทสินค้า'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
