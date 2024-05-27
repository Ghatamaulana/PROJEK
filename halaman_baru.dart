import 'dart:convert';

import 'package:bukutamu_mobile/tambah_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HalamanBaru extends StatefulWidget {
  const HalamanBaru({super.key});

  @override
  State<HalamanBaru> createState() => _HalamanBaruState();
}

class _HalamanBaruState extends State<HalamanBaru> {
  List _Listdata = [];
  bool _loading = true;

  Future _getdata() async {
    try {
      final respon = await http.get(Uri.parse(
          'http://192.168.93.166/praktik%20S2/bukutamu_mobile/read.php'));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _Listdata = data;
          _loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buku Tamu'),
        backgroundColor: Colors.amberAccent,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _Listdata.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_Listdata[index]['username']),
                    subtitle: Text(_Listdata[index]['komentar']),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        child: Text('Tambah',style: TextStyle(fontSize: 14),),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TambahData()
          ));
        },
      ),
    );
  }
}
