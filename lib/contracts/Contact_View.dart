import 'package:flutter/material.dart';
import 'package:work6/contracts/Contract_class.dart';

class ContactView extends StatelessWidget {
  final List<Contact> contacts;

   ContactView({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contacts[index];
        return Card(
          margin:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber.shade800,
              foregroundColor: Colors.white,
              child: Text(
                contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
                style:  TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              contact.name,
              style:  TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              contact.phoneNumber,
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Viewing details for ${contact.name}')),
              );
            },
            trailing: IconButton(
              icon:  Icon(Icons.call, size: 20),
              color: Colors.green.shade700,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Calling ${contact.name}...')),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

