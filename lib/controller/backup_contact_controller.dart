import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BackupContactsController extends GetxController {
  final backedUpContacts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchBackedUpContacts();
    super.onInit();
  }

  void fetchBackedUpContacts() {
    FirebaseFirestore.instance
        .collection('backedUpContacts')
        .snapshots()
        .listen((snapshot) {
      final contacts = snapshot.docs
          .map((doc) => {
                'id': doc.id,
                'name': doc['name'],
                'phoneNumber': doc['phoneNumber'],
              })
          .toList();
      backedUpContacts.assignAll(contacts);
    });
  }

  Future<void> deleteContact(String id) async {
    await FirebaseFirestore.instance
        .collection('backedUpContacts')
        .doc(id)
        .delete();
    Get.snackbar('Success', 'Contact deleted from backup!');
  }
}
