import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_login/core/components/warna_color.dart';
import 'package:ui_login/core/screen/ticket/data/tiket_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final TiketCategoriController = TextEditingController();
  final priceController = TextEditingController();
  String kategoriValue = '';
  String kriteriaValue = '';

  List<Map<String, dynamic>> dataTiket = [];
  int? selectedIndex; // untuk save index data yang di edit

  @override
  void initState(){
    super.initState();
    _loadData(); // memuat data
  }

  Future<void> _saveData() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ticket', jsonEncode(dataTiket));
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('ticket');
    if (data != null) {
      setState(() {
        dataTiket = List<Map<String, dynamic>>.from(jsonDecode(data));
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: WarnaColor.utama),
        ),
        centerTitle: true,
        title: Text(
          'Kelola Tiket',
          style: const TextStyle(
            color: WarnaColor.utama,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () async {
            await showDialog(context: context,
             builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Nama tiket'),
                      TextField(
                        controller: TiketCategoriController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nama tiket',
                        ),
                      ),
                      SizedBox(height: 24.0,),
                       Text('Harga'),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Harga',
                          prefixText: 'Rp ',
                        ),
                      ),
                      const SizedBox(height: 24.0,),
                      Text('Kategori'),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Kategori'
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Mancanegara',
                            child: Text('Mancanegara'),
                          ),
                          DropdownMenuItem(
                            value: 'Nusantara',
                            child: Text('Musantara'),
                            ),
                        ],
                         onChanged: (value) {
                          kategoriValue = value ?? '';
                          print(kategoriValue);
                         },
                         ),
                         const SizedBox(),
                         Text('Kriteria'),
                         DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Kriteria'
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'Perorangan',
                              child: Text('Perorangan'),
                              ),
                            DropdownMenuItem(
                              value: 'Romobongan',
                              child: Text('Rombongan'),
                              ),
                          ],
                           onChanged: (value) {
                            kriteriaValue = value ?? '';
                           },
                           ),
                           const SizedBox(height: 24.0),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              button(label: 'Batalkan',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              buttonColor: Colors.red,),
                              button(label: 'Simpan',
                              onPressed: () {
                                dataTiket.add({
                                  'ticket_name':TiketCategoriController.text,
                                  'price': 'Rp ${priceController.text}',
                                  'category': kategoriValue,
                                  'kireteria': kriteriaValue,
                                });
                                TiketCategoriController.clear();
                                priceController.clear();
                                kriteriaValue = '';
                                kategoriValue = '';
                                 Navigator.pop(context);
                              },
                              ),
                            ],
                           ),
                    ],
                  ),
                  ),
              );
             },
             );
             print(dataTiket);
             print(kriteriaValue);
             setState(() {
               
             });
          }, icon: Icon(Icons.add_box_rounded, color: WarnaColor.utama,),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: dataTiket.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataTiket[index]['ticket_name']),
            subtitle: Text(dataTiket[index]['price']),
            trailing: Text(dataTiket[index]['category']),
            
          );
        },
      ),
    );
  }
}
