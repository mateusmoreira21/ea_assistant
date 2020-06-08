import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardModel {
  getTotal() {
    {
      return Firestore.instance.collection("lancamentos").snapshots();
    }
  }
}
