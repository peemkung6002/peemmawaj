import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'productdetail.dart';

class ShowFilterType extends StatefulWidget {
  final String productType;

  const ShowFilterType({super.key, required this.productType});

  @override
  _ShowFilterTypeState createState() => _ShowFilterTypeState();
}

class _ShowFilterTypeState extends State<ShowFilterType> {
  late DatabaseReference dbRef;
  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref('products');
    fetchProducts();
  }

  // ฟังก์ชันเพื่อแปลงวันที่
  String formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }

  // ดึงข้อมูลสินค้าจาก Firebase ตามประเภทที่เลือก
  Future<void> fetchProducts() async {
    try {
      final query = dbRef.orderByChild('category').equalTo(widget.productType);
      final snapshot = await query.get();
      if (snapshot.exists) {
        List<Map<String, dynamic>> loadedProducts = [];
        snapshot.children.forEach((child) {
          Map<String, dynamic> product =
              Map<String, dynamic>.from(child.value as Map);
          loadedProducts.add(product);
        });

        setState(() {
          filteredProducts = loadedProducts;
        });
      } else {
        print("ไม่พบสินค้าประเภทนี้ในฐานข้อมูล");
      }
    } catch (e) {
      print("Error loading products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สินค้าประเภท ${widget.productType}'),
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // แสดงรายละเอียดสินค้า
                        Text('รายละเอียด: ${product['description']}'),
                        // แสดงวันที่ผลิต
                        Text('วันที่ผลิต: ${formatDate(product['productionDate'])}'),
                        // แสดงจำนวนสินค้า
                        Text('จำนวน: ${product['quantity']}'),
                        // แสดงประเภทสินค้า
                        Text('ประเภท: ${product['category']}'),
                        // แสดงราคา
                        Text('ราคา: ${product['price']} บาท'),
                      ],
                    ),
                    onTap: () {
                      // เมื่อคลิกที่รายการสินค้าให้ไปยังหน้ารายละเอียดสินค้า
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
