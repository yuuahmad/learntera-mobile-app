import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learntera/services/ofline_services/buku.dart';

class DapatkanBuku {
  final Stream<QuerySnapshot> _dataSemuaBuku = FirebaseFirestore.instance.collection('buku').snapshots();

  List<Buku> dataBuku() {
    try {
      var listBukusaya = <Buku>[];
      _dataSemuaBuku.map((event) {
        Map<String, dynamic> dataBukunya = event as Map<String, dynamic>;
        return Buku(
            judulBuku: dataBukunya['judul_buku'],
            ratingBuku: dataBukunya['rating_buku'],
            deskripsiBuku: dataBukunya['deskripsi_buku'],
            pengarang: dataBukunya['pengarang']);
      }).toList();
      print(listBukusaya);
      return listBukusaya;
    } catch (e) {
      print("terjadi kesalahan dalam mengambil data buku");
      return [
        Buku(
            judulBuku: "judulBuku",
            ratingBuku: "ratingBuku",
            deskripsiBuku: "deskripsiBuku",
            pengarang: 'tidak diketahui')
      ];
    }
  }
}
