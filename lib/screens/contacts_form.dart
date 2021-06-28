import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatefulWidget {
  @override
  _ContactsFormState createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  final FocusNode _focusName = FocusNode();
  final FocusNode _focusAccountNumber = FocusNode();
  final FocusNode _focusButton = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                focusNode: _focusName,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  labelStyle: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onSubmitted: (_){
                  FocusScope.of(context).requestFocus(_focusAccountNumber);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  focusNode: _focusAccountNumber,
                  controller: _accountNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Account number',
                    labelStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onSubmitted: (_){
                    FocusScope.of(context).requestFocus(_focusButton);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    focusNode: _focusButton,
                    onPressed: () {
                      final String name = _nameController.text;
                      final int? accountNumber =
                          int.tryParse(_accountNumberController.text);
                      final Contact newContact =
                          Contact(0, name, accountNumber!);
                      _dao.save(newContact).then((id) =>
                          Navigator.pushNamed(context, '/contactsList'));
                    },
                    child: Text('Create'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
