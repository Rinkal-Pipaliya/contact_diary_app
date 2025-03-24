import 'package:contact_diary_app/helper/db_helper.dart';
import 'package:contact_diary_app/model/contact_model.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxList<Contact> contacts = <Contact>[].obs;

  Future<void> loadContacts() async {
    final data = await DbHelper.instance.getContacts();
    contacts.assignAll(data);
  }

  Future<void> addContact(Contact contact) async {
    await DbHelper.instance.insertContact(contact);
    loadContacts();
  }

  Future<void> updateContact(Contact contact) async {
    await DbHelper.instance.updateContact(contact);
    loadContacts();
  }

  Future<void> deleteContact(int id) async {
    await DbHelper.instance.deleteContact(id);
    loadContacts();
  }
}
