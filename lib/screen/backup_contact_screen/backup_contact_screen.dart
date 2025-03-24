import 'package:contact_diary_app/controller/backup_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackupContactsScreen extends StatelessWidget {
  const BackupContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BackupContactsController controller =
        Get.put(BackupContactsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backed-Up Contacts'),
      ),
      body: Obx(() {
        if (controller.backedUpContacts.isEmpty) {
          return const Center(child: Text('No backed-up contacts found.'));
        }
        return ListView.builder(
          itemCount: controller.backedUpContacts.length,
          itemBuilder: (context, index) {
            final contact = controller.backedUpContacts[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(contact['name'][0]),
              ),
              title: Text(contact['name']),
              subtitle: Text('Phone: ${contact['phoneNumber']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteContact(contact['id']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
