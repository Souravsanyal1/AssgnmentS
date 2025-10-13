import 'package:flutter/material.dart';

import 'Contract_class.dart';

class CustomSearchDelegate extends SearchDelegate<Contact?> {
  final List<Contact> contacts;
  CustomSearchDelegate({required this.contacts})
      : super(
    searchFieldLabel: 'Search contacts',
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';

          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Contact> matchQuery = contacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (matchQuery.isEmpty) {
      return Center(child: Text('No results found for "$query"'));
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            child: Text(
              result.name.isNotEmpty ? result.name[0].toUpperCase() : '?',
            ),
          ),
          title: Text(
            result.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(result.phoneNumber),
          onTap: () {
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Contact> matchQuery = contacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase()) ||
          contact.phoneNumber.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(result.name),
          subtitle: Text(result.phoneNumber),
          onTap: () {
            query = result.name;
            showResults(context);
          },
        );
      },
    );
  }
}


// এই পেইজে সার্চ এর সিস্টেম আছে