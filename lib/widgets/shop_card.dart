import 'package:flutter/material.dart';
import 'package:pinkloset/screens/menu.dart';
import 'package:pinkloset/screens/shoplist_form.dart';
import 'package:pinkloset/screens/view_items.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor; // Variabel untuk menentukan warna latar belakang

    // Menentukan warna berdasarkan nama item
    if (item.name == "Lihat Item") {
      cardColor = Colors.pink.shade600; // Warna untuk "Lihat Produk"
    } else if (item.name == "Tambah Item") {
      cardColor = Colors.pink.shade300; // Warna untuk "Tambah Produk"
    } else if (item.name == "Logout") {
      cardColor = Colors.pink.shade100; // Warna untuk "Logout"
    } else {
      cardColor = Colors.indigo; // Warna default jika tidak ada yang cocok
    }

    return Material(
      color: cardColor, // Menggunakan warna yang telah ditentukan
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

            if (item.name == "Tambah Item") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShopFormPage()));
            } else if (item.name == "Lihat Item") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListPage()));
            }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 50.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}