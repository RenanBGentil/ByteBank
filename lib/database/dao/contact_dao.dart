import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contacts.dart';
import 'package:sqflite/sqflite.dart';


class ContactDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async{
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {

    final Database db = await createDatabase();
    List<Contact> contacts = await _toList(db);
    return contacts;
  }

  Future<List<Contact>> _toList(Database db) async {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in await db.query(_tableName)) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}