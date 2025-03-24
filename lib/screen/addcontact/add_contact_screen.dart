import 'package:contact_diary_app/controller/contact_controller.dart';
import 'package:contact_diary_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditContactScreen extends StatelessWidget {
  const AddEditContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.find();
    final Contact? contact = Get.arguments;

    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phoneNumber;
      emailController.text = contact.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                maxLength: 10,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final newContact = Contact(
                        id: contact?.id,
                        name: nameController.text,
                        phoneNumber: phoneController.text,
                        email: emailController.text,
                      );
                      if (contact == null) {
                        contactController.addContact(newContact);
                      } else {
                        contactController.updateContact(newContact);
                      }
                      Get.back();
                    }
                  },
                  child: Text(contact == null ? 'Save' : 'Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
