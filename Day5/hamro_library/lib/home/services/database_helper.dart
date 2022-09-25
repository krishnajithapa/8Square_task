// import 'dart:io';

// import 'package:hamro_library/home/models/book_model.dart';
// import 'package:hamro_library/home/models/staticdata.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static const _databaseName = "MyDatabase.db";
//   static const _databaseVersion = 2;

//   static const table = 'books';

//   static const columnId = '_id';
//   static const columnName = 'bookName';
//   static const columnCatagory = 'catagory';
//   static const columnPrice = 'price';
//   static const columnAuthor = 'author';

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;
//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId integer primary key,
//             $columnName text not null,
//             $columnAuthor text not null,
//             $columnCatagory text not null,
//             $columnPrice integer not null
//           )
//           ''').then((value) async {
//       for (int i = 0; i < tableData.length; i++) {
//         await db.insert(table, tableData[i]);
//       }
//     });
//   }

//   insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;

//     int value = await db.insert(table, row);
//     print(value);
//     return value;
//   }

//   Future<List<Book>> queryAllRows() async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> mapList = await db.query(table);
//     List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();
//     return bookList;
//   }

//   Future<List<Book>> searchByName(name_of_book) async {
//     Database db = await instance.database;
//     final response = await db.query(
//       table,
//       distinct: false,
//       orderBy: '_id',
//       where: 'bookName = ?',
//       whereArgs: [name_of_book],
//     );
//     List<Book> bookList = response.map((e) => Book.fromJson(e)).toList();
//     return bookList;
//   }

//   Future<int?> queryRowCount() async {
//     Database db = await instance.database;
//     return Sqflite.firstIntValue(
//         await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   }

//   Future<List<Book>> getAllBooksBycatagory(String catagoryName) async {
//     final db = await database;
//     final response = await db.query(
//       table,
//       distinct: true,
//       orderBy: '_id',
//       where: '$columnCatagory = ?',
//       whereArgs: [catagoryName],
//     );
//     List<Book> bookList = response.map((e) => Book.fromJson(e)).toList();
//     return bookList;
//   }

//   Future<int> update(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row[columnId];
//     return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//   }

//   Future<int> delete(int id) async {
//     Database db = await instance.database;
//     return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//   }
// }
