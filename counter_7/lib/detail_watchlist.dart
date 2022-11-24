import 'package:counter_7/data_budget.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/mywatchlistpage.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/mywatchlist.dart';

class DetailPage extends StatelessWidget{
  final MyWatchList watchList;
  const DetailPage({super.key, required this.watchList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pop(context);
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
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
                  },
                ),
            ListTile(
                  title: const Text('MyWatchList'),
                  onTap: () {
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                );
                  },
                ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Center(
            child: Text(
              watchList.fields.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ),
          const SizedBox(height: 10,),

          Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Release Date: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    watchList.fields.releaseDate.toString().split(" ")[0],
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Rating: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "${watchList.fields.rating.toString()} / 10",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Status: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    watchList.fields.isWatched? "Ditonton":"Belum Ditonton",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),

              Row(
                children: [
                  Flexible(
                    child: Text(
                      watchList.fields.review,
                      style: const TextStyle(fontSize: 18),
                    )
                  )
                ],
              )
            ]
          ),

          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      )
    );
  }
}