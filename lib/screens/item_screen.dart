import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/database_helper.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Map<String, dynamic>> _items = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  bool isEditing = false; // ✅ لتحديد إذا في وضع التعديل أو الإضافة
  int? editingItemId; // لتخزين ID العنصر اللي بنعدله

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await _databaseHelper.getAllItems();
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem() async {
    await _databaseHelper.insertItem({
      'name': nameController.text,
      'price': double.tryParse(priceController.text) ?? 0.0,
      'quantity': int.tryParse(quantityController.text) ?? 0,
    });
    _clearFields();
    _loadItems();
  }

  Future<void> _updateItem() async {
    if (editingItemId == null) return;

    await _databaseHelper.updateItem({
      'id': editingItemId,
      'name': nameController.text,
      'price': double.tryParse(priceController.text) ?? 0.0,
      'quantity': int.tryParse(quantityController.text) ?? 0,
    });

    _clearFields();
    setState(() {
      isEditing = false;
      editingItemId = null;
    });
    _loadItems();
  }

  Future<void> _deleteItem(int id) async {
    await _databaseHelper.deleteItem(id);
    _loadItems();
  }

  void _clearFields() {
    nameController.clear();
    priceController.clear();
    quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            // ✅ الزر يتغير حسب الوضع
            ElevatedButton(
              onPressed: isEditing ? _updateItem : _addItem,
              style: ElevatedButton.styleFrom(
                backgroundColor: isEditing ? Colors.orange : Colors.blue,
              ),
              child: Text(isEditing ? 'Update Item' : 'Add Item'),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text(
                          'Price: ${item['price']} | Qty: ${item['quantity']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // ✅ نملأ الحقول ونفعّل وضع التعديل
                              setState(() {
                                isEditing = true;
                                editingItemId = item['id'];
                                nameController.text = item['name'];
                                priceController.text =
                                    item['price'].toString();
                                quantityController.text =
                                    item['quantity'].toString();
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteItem(item['id']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
