import 'package:counter_7/data_budget.dart';
import 'package:counter_7/detail_watchlist.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/fetch.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
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
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
                  },
                ),
            ListTile(
                  title: const Text('MyWatchList'),
                  onTap: () {
                  Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada WatchList :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        child: ListTile(
                          title: Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          ),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailPage(
                                    watchList: snapshot.data![index],
                                  )
                              ),
                            );
                          }
                        )
                      )
                )
                );
            }
            }
          }),
    );
  }
}