# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa saja tanpa membuat model terlebih dahulu, namun model diperlukan dalam melakukan get http response guna kemudahan developer untuk mengakses, mengolah dan mengoperasikan data yang ada.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

### TextStyle: berfungsi untuk memberikan styling pada text

### Text: untuk menampilkan text pada aplikasi yang dibuat

###  Column: berfungsi untuk mengatur posisi letak widget

### Center: untuk meletakkan widget ke bagian tengah

### ListView.builder : berfungsi untuk menampilkan list of children yang dapat di scroll

### SizedBox : berfungsi untuk membuat box sehingga juga digunakan untuk menambah jarak

###  Container : berfungsi sebagai pembungkus widget lainnya

### FutureBuilder : berfungsi untuk fetching data

## Mekanisme pengambilan data dari json ke Flutter

## Menambahkan dependensi http terlebih dahulu

## Membuat function http request dengan method GET secara async

## Membuat model sesuai dengan data yang ingin diambil

## Melakukan HTTP request dengan method GET dan secara otomatis akan di convert sesuai format model yang telah dibuat

## Menampilkan data menggunakan FutureBuilder


# Tugas 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator merupakan widget yang digunakan pada flutter untuk melakukan pergantian screen to screen yang telah dibuat sebelumnya. Untuk Navigator.push sendiri berfungsi untuk mengubah tampilan screen dengan hanya menambahkan screen baru ke atas stack dari navigation. Sedangkan, Navigator.pushReplacement akan melakukan pop terhadap screen sebelumnya lalu melakukan push screen yang baru.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

### Drawer
Untuk menavigasi ke screen lain
### ListTile
Untuk membuat widget berbentuk list
### Form
Sebagai wadah widget-widget pembentuk form
### TextFormField
Widget form yang menerima input text field
### DropdownButton
Widget form dalam bentuk dropdown
### ListView
Untuk menampung child dari widget-widget kedalam sebuah tampilan yang scrollable

## Sebutkan jenis-jenis event yang ada pada Flutter.

### onTap()

### onPressed()

### onChanged()

### onSaved()

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator mengadopsi konsep dari Stack secara umum  (Last in First out). Dimana ketika ingin berganti page, jika menggunakan Navigator.push maka page akan langsung ditambahkan ke top of stack. Sedangkan jika menggunakan Navigator.pushReplacement, page sebelumnya akan di-pop terlebih dahulu yang kemudian akan melakukan push page yang baru.

## Step by step explanation

### Membuat drawer pada setiap page yang akan merefer ke page-page yang dimaksud.

### Membuat halaman form yang akan menerima input dari user

Menambahkan kode berikut pada file form.dart
```shell
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/class_budget.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaBudget = "";
  int _nominal = 0;
  double umur = 0;
  String _jenis = 'Pilih Jenis';
  List<String> listJenis = ['Pilih Jenis','Pemasukan', 'Pengeluaran'];
  List<List<String>> listData = [];
  final fieldJudul = TextEditingController();
  final fieldNominal = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Tambah Budget'),
            ),
            drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Counter'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Tambah Budget'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Data Budget'),
                  onTap: () {
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
                  },
                ),
              ],
            ),
          ),
        body: Form(key: _formKey, child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: Sate Pacil",
                            labelText: "Judul",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.account_balance_wallet_outlined),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _namaBudget = value!;
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _namaBudget = value!;
                            });
                        },

                        controller: fieldJudul,
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),
                Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 20000",
                            labelText: "Nominal",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.money),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        controller: fieldNominal,
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }
                            if (int.tryParse(value) == null){
                              return 'Nominal harus dalam bentuk angka!';
                            }
                            return null;
                        },
                    ),
                ),
            DropdownButtonFormField(
                value: _jenis,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listJenis.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
                }).toList(),
                
                onChanged: (String? newValue) {
                setState(() {
                    _jenis = newValue!;
                });
                },
                
                validator: (String? _jenis) {
                            if (_jenis == 'Pilih Jenis') {
                                return 'Silahkan pilih jenis!';
                            }
                            return null;
                        },
                
              ),
            TextButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ListBudget.listdata.add(Budget(_namaBudget, _nominal, _jenis));
                  showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    child: Container(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(child: const Text('Berhasil ditambahkan!')),
                          SizedBox(height: 20),
                          Center(
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama: $_namaBudget",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Nominal: $_nominal",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Jenis: $_jenis",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              fieldJudul.clear();
                              fieldNominal.clear();
                            },
                            child: Text('Kembali'),
                          ), 
                        ],
                      ),
                    ),
                  );
                },
              );
                }
              },
            ),

          ],
        ),),
      ),),
    );
  }
}
```
data yang terinput oleh user akan ditampung oleh ListBudget yang merupakan sekumpulan class Budget

### Membuat page untuk menampilkan data-data budget
Membuat file data_budget.dart yang akan berisikan:
```shell
import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/class_budget.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Counter'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                    );
                  },
                ),
                ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
                ListTile(
                  title: const Text('Data Budget'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ListBudget.listdata[index].judul,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ListBudget.listdata[index].nominal.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        ListBudget.listdata[index].jenis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: ListBudget.listdata.length,
      ),
    );
  }
}
```

# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget emrupakan widget yang bersifat statis. Statis disini berarti tampilan dari widget tersebut tidak perlu memerlukan update dan perubahan secara terus menerus. Sedangkan stateful widget merupakan widget yang bersifat dinamis. Dinamis artinya developer menggunakan widget ini untuk membuat sebuah tampilan yang state-nya dapat diubah-ubah sesuai kebutuhan seperti halnya yang digunakan pada Tugas 7 kali ini.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

### Scaffold
Berfungsi sebagai kerangka dari sebuah halaman

### AppBar
Berfungsi sebagai header / tempat dari judul sebuah aplikasi

### Floating Action Button
Berfungsi menambilkan button yang akan merefer ke sebuah event

### Center
Berfungsi untuk meletakan widget ke tengah tampilan page aplikasi

### Column
Berfungsi untuk mengemas elemen widget ke bentuk susunan vertical

### Row
Berfungsi untuk mengemas elemen widget ke bentuk susunan horizontal

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() berfungsi untuk merubah state yang ada di stateful widget. Dimana perubahan state ini mengindikasikan adanya perubahan data pada variabel yang akan ditampilkan. Variabel yang terdampak dengan fungsi tersebut pada Tugas 7 kali ini iyalah variabel _counter dan _paritas.

## Jelaskan perbedaan antara const dengan final.

Const dan final merupakan kedua hal yang hampir serupa. Namun hanya saja const diperuntukkan untuk menampung suatu data final yang sudah diketahui valuenya sedari awal (compile time). Sedangkan final, cenderung dipergunakan untuk mendapatkan value yang belum diketahui pada compile time (mendapatkan ketika runtime).

## Step by Step Explanation

Membuat sebuah aplikasi flutter baru menggunakan command

```shell
flutter create counter_7
```

Menambahkan button untuk melakukan increment dan decrement
```shell
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (_counter != 0)...[
              FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: _decrementCounter
              ),
            ],
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _incrementCounter
            )
          ],
      )
    ),
```

Menambahkan function increment dan decrement untuk mengupdate tampilan ketika button ditekan

```shell
int _counter = 0;
  String _paritas = "GENAP";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0){
        _paritas = "GENAP";
      } else{
        _paritas = "GANJIL";
      }
    });
  }
  void _decrementCounter() {
    setState(() {
      if (_counter != 0){
        _counter--;

      }
      if (_counter % 2 == 0){
        _paritas = "GENAP";
      } else{
        _paritas = "GANJIL";
      }
    });
  }
```



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
