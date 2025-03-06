import 'package:flutter/material.dart';
import 'Addpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];

  void _addItem(Map<String, dynamic> newItem) {
    setState(() {
      _items.add(newItem);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComputerParts_App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 40, 126, 255),
        elevation: 5, // เพิ่มเงาให้แอปบาร์ดูดีขึ้น
      ),
      body: _items.isEmpty
          ? Center(
              child: Text(
                'ไม่มีข้อมูลในรายการ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Dismissible(
                  key: Key(item['name']),
                  background: Container(
                    color: Colors.red, // สีแดงเมื่อปัดลบ
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white, // สีของไอคอน delete
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    _deleteItem(index);
                  },
                  child: Card(
                    elevation: 3, // เพิ่มเงาให้ดูน่าสนใจ
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // มุมโค้งมน
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: Icon(
                        Icons.computer, // ไอคอนของคอมพิวเตอร์
                        color: Color.fromARGB(255, 40, 126, 255),
                        size: 30,
                      ),
                      title: Text(
                        item['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'ประเภท: ${item['category']}\nจำนวน: ${item['quantity']} ชิ้น\nวันที่: ${item['date']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
          if (newItem != null) {
            _addItem(newItem);
          }
        },
        backgroundColor: Color.fromARGB(255, 40, 126, 255),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
