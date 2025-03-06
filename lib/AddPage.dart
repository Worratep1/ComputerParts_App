import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _quantity = 0;
  DateTime _selectedDate = DateTime.now();
  String _category = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มชิ้นส่วนคอมพิวเตอร์', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Color.fromARGB(255, 40, 126, 255),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ชื่อชิ้นส่วน
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ชื่อชิ้นส่วน',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ชื่อ';
                  }
                  return null;
                },
                onChanged: (value) => _name = value,
              ),
              SizedBox(height: 20),

              // จำนวน
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'จำนวนชิ้นส่วน',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่จำนวน';
                  }
                  return null;
                },
                onChanged: (value) => _quantity = int.tryParse(value) ?? 0,
              ),
              SizedBox(height: 20),

              // วันที่
              ListTile(
                title: Text(
                  "เลือกวันที่",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                subtitle: Text("${_selectedDate.toLocal()}", style: TextStyle(color: Colors.black87)),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 20),

              // ประเภทชิ้นส่วน
              DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: 'ประเภทชิ้นส่วน',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                onChanged: (value) => setState(() {
                  _category = value!;
                }),
                items: ['null', 'Motherboard', 'RAM', 'GPU', 'Storage', 'Mouse', 'CPU']
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),

              // ปุ่มบันทึก
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context, {
                      'name': _name,
                      'quantity': _quantity,
                      'category': _category,
                      'date': _selectedDate,
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 40, 126, 255),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('บันทึก', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
