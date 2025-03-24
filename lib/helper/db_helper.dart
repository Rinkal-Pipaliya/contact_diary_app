import 'package:contact_diary_app/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final _databaseName = "contacts.db";
  static final _databaseVersion = 1;

  static final table = 'contacts';

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phoneNumber TEXT NOT NULL,
        email TEXT NOT NULL,
        isBackedUp INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertContact(Contact contact) async {
    Database db = await database;
    return await db.insert(table, contact.toMap());
  }

  Future<int> updateContact(Contact contact) async {
    Database db = await database;
    return await db.update(
      table,
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Contact>> getContacts() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Contact.fromMap(map)).toList();
  }
}
