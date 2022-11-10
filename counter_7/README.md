# counter_7

A new Flutter project.

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
