// dengan keyword await maka proses selanjutnya harus menunggu hingga proses async selesai

void main(List<String> args) async {
  print('Pelanggan 1 Minta Menu');
  menu();
  pesan('Bakso').then((String hasil) {
    print(hasil);
  }).catchError((error) {
    print(error);
  });

  print('Pelanggan 2 Minta Menu');
  menu();
  try {
    String pesanan = await pesan('Nasi Goreng');
    print(pesanan);
  } catch (error) {
    print(error);
  }

  print('Pelanggan 3 Minta Menu');
  menu();
  await pesan('Es Teler').then((String hasil) {
    print(hasil);
  }).catchError((error) {
    print(error);
  });

  print('Toko Tutup!');
}

listMenu() {
  var listMenu = ['Bakso', 'Mie Ayam', 'Es Teh', 'Kopi'];
  return listMenu;
}

void menu() {
  var no = 1;
  print("====== Menu ======");
  for (var i in listMenu()) {
    print("${no++}. $i");
  }
  print('');
}

Future<String> pesan(String pilihan) {
  return Future.delayed(Duration(seconds: 2), () {
    if (listMenu().contains(pilihan)) {
      return "Pesanan $pilihan diterima\n";
    } else {
      throw "Tidak ada menu $pilihan \n";
    }
  });
}
