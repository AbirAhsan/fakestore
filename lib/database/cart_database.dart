import 'package:fakestore/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabaseHelper {
  final _databaseName = "cart.db";
  final _databaseVersion = 1;

  CartDatabaseHelper._privateConstructor();
  static final CartDatabaseHelper instance =
      CartDatabaseHelper._privateConstructor();
  late Database _database;

  Future<Database> get database async {
    //if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE ${CartModel.tblcarts} (
    ${CartModel.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CartModel.colProductId} INTEGER ,
    ${CartModel.colTitle} TEXT,
    ${CartModel.colPrice} TEXT,
    ${CartModel.colCount} INTEGER,
    ${CartModel.colImage} TEXT
    )
  ''');
  }

  Future<int> insert(CartModel? cartModel) async {
    Database db = await database;
    var res = await db.insert(CartModel.tblcarts, cartModel!.toMap());

    return res;
  }

  Future<bool> queryCart(int productID) async {
    Database db = await database;
    List<Map<String, dynamic>> cart = await db.query(
      CartModel.tblcarts,
      where: '${CartModel.colProductId}=?',
      whereArgs: [productID],
    );
    return cart.isEmpty ? false : true;
  }

  Future<List<CartModel?>> fetchSingleCart(int productID) async {
    Database db = await database;
    List<Map<String, dynamic>> cart = await db.query(
      CartModel.tblcarts,
      where: '${CartModel.colProductId}=?',
      whereArgs: [productID],
    );
    print(cart);
    return cart.isEmpty ? [] : cart.map((x) => CartModel.fromMap(x)).toList();
  }

  Future<int> increaseCount(int productID, count) async {
    Database db = await database;
    return await db.update(
        CartModel.tblcarts,
        {
          CartModel.colCount: count,
        },
        where: '${CartModel.colProductId}=?',
        whereArgs: [productID]);
  }

  // Future<int> delete(int id) async {
  //   Database db = await database;
  //   return await db
  //       .delete(Jokes.tblJokes, where: '${Jokes.colID} = ?', whereArgs: [id]);
  // }

// Fetch Data Which one added to cart

  Future<List<CartModel?>> fetchCart() async {
    Database db = await database;

    List<Map<String, dynamic>> cart = await db.query(
      CartModel.tblcarts,
      // where: '${Jokes.colActive}=?',
      // whereArgs: [1],
    );
    return cart.isEmpty ? [] : cart.map((x) => CartModel.fromMap(x)).toList();
  }

// //<============== Fetch Data Which Category Match

//   Future<List<Jokes?>> fetchJokesByCategory(int CatId) async {
//     Database db = await database;
//     List<Map<String, dynamic>> jokes = await db.query(
//       Jokes.tblJokes,
//       where: '${Jokes.colCatID}=?',
//       whereArgs: [CatId],
//     );
//     return jokes.isEmpty ? [] : jokes.map((x) => Jokes.fromMap(x)).toList();
//   }

//   Future<List<Map<String, Object?>>> clearTable() async {
//     Database db = await instance.database;
//     return await db.rawQuery("DELETE FROM ${Jokes.tblJokes}");
//   }
}
