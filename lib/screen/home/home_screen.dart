import 'package:contact_diary_app/controller/contact_controller.dart';
import 'package:contact_diary_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    contactController.loadContacts();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Diary',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_upload, size: 28),
            onPressed: () {
              Get.toNamed(AppRoutes.backupContact);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (contactController.contacts.isEmpty) {
          return const Center(
            child: Text(
              'No contacts available.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: contactController.contacts.length,
          itemBuilder: (context, index) {
            final contact = contactController.contacts[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    contact.name[0],
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  contact.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  contact.phoneNumber,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    contactController.deleteContact(contact.id!);
                  },
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.addContact, arguments: contact);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/addContact');
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
