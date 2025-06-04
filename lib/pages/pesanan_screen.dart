import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LaundryOrder {
  final String orderId;
  final DateTime orderDate;
  final String status;
  final List<String> items;
  final double totalWeight;
  final double totalPrice;

  LaundryOrder({
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.items,
    this.totalWeight = 0.0,
    this.totalPrice = 0.0,
  });
}

class LaundryOrderScreen extends StatefulWidget {
  @override
  _LaundryOrderScreenState createState() => _LaundryOrderScreenState();
}

class _LaundryOrderScreenState extends State<LaundryOrderScreen> {
  final List<LaundryOrder> _orders = [
    LaundryOrder(
      orderId: 'ORD-20250604-001',
      orderDate: DateTime.now().subtract(Duration(days: 1)),
      status: 'Processing',
      items: ['2 kg Pakaian Campuran', '1 Sprei'],
      totalWeight: 2.5,
      totalPrice: 15000,
    ),
    LaundryOrder(
      orderId: 'ORD-20250604-002',
      orderDate: DateTime.now(),
      status: 'Out for Delivery',
      items: ['3 kemeja', '2 celana panjang', '5 kaos'],
      totalWeight: 1.8,
      totalPrice: 18000,
    ),
  ];

  void _tambahPesanan(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _itemsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Pesanan Baru'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: _itemsController,
                    decoration: InputDecoration(
                      labelText: 'Item Pesanan (pisahkan dengan koma)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan setidaknya satu item pesanan';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  // Anda bisa menambahkan field lain seperti status, berat, harga jika diperlukan
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Tambah'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final items =
                      _itemsController.text
                          .split(',')
                          .map((item) => item.trim())
                          .toList();
                  setState(() {
                    _orders.add(
                      LaundryOrder(
                        orderId:
                            'ORD-${DateFormat('yyyyMMddHHmmss').format(DateTime.now())}',
                        orderDate: DateTime.now(),
                        status: 'Pending', // Status default
                        items: items,
                        totalWeight: 0.0, // Bisa Anda sesuaikan
                        totalPrice: 0.0, // Bisa Anda sesuaikan
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _hapusPesanan(int index) {
    setState(() {
      _orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesanan Laundry')),
      body:
          _orders.isEmpty
              ? Center(child: Text('Belum ada pesanan.'))
              : ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID Pesanan: ${order.orderId}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Tanggal Pesanan: ${DateFormat('dd MMMM🚮 HH:mm').format(order.orderDate)}',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Status: ${order.status}',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: _getStatusColor(order.status),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Item:', style: TextStyle(fontSize: 14.0)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                order.items
                                    .map(
                                      (item) => Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                        ),
                                        child: Text(
                                          '- $item',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Berat: ${order.totalWeight} kg',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                'Total Harga: Rp ${order.totalPrice}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Tambahkan logika untuk melihat detail pesanan
                                  print(
                                    'Lihat Detail Pesanan ${order.orderId}',
                                  );
                                },
                                child: Text('Lihat Detail'),
                              ),
                              SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  _hapusPesanan(index);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tambahPesanan(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return Colors.blue;
      case 'out for delivery':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'pending':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}
