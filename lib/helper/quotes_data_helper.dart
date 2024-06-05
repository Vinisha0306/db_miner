import 'package:db_miner/modal/Api_modal.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

enum LikeQuotesTable { id, text, author, category, image }

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  Logger logger = Logger();
  String sql = '';
  String dbName = "my_dataBase";
  String tableName = "LikeQuotes";

  late Database database;

  Future<void> initDb() async {
    String path = await getDatabasesPath();

    database = await openDatabase("$path/$tableName", version: 3,
        onCreate: (db, version) {
      String query =
          """create table if not exists $tableName (${LikeQuotesTable.id.name} integer primary key,
                          ${LikeQuotesTable.text.name} text not null,
                          ${LikeQuotesTable.author.name} text
                          ${LikeQuotesTable.category.name} text
                          ${LikeQuotesTable.image.name} text
                          )""";

      db
          .execute(query)
          .then(
            (value) => logger.i("Table Create successfully"),
          )
          .onError(
            (error, stackTrace) => logger.e("ERROR : $error"),
          );
    }, onUpgrade: (db, v1, v2) {
      sql = "alter table $tableName add column category text";
      db
          .execute(sql)
          .then((value) => logger.i('alter category added'))
          .onError((error, stackTrace) => logger.e('error : $error'));
    });
  }

  Future<void> insertData({required Quotes quotes, required image}) async {
    sql =
        "insert into $tableName(id,text,author,category,image) values(?,?,?,?,?);";
    List args = [quotes.id, quotes.text, quotes.author, quotes.category, image];
    await database.rawInsert(sql, args);
  }

  Future<List<Quotes>> getAllData() async {
    List<Quotes> allLikeData = [];

    sql = "select * from $tableName;";
    List Data = await database.rawQuery(sql);
    allLikeData = Data.map((e) => Quotes.fromJson(e)).toList();

    return allLikeData;
  }

  Future<void> deleteData({required int id}) async {
    await database
        .delete(
          tableName,
          where: "id=?",
          whereArgs: [id],
        )
        .then(
          (value) => logger.i('Deleted'),
        )
        .onError(
          (error, stackTrace) => logger.e('Error : $error'),
        );
  }
}
