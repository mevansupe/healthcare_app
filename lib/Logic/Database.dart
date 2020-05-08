import 'package:mongo_dart/mongo_dart.dart';

class Database {

  Future<bool> registerUser(userData) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('users');

      await usersCollection.insert(userData);

      return true;
      
      db.close();
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getUserDetails(userId) async{
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('users');

      // await usersCollection
      // .find(where.eq("email", userId)).forEach((v) => {
      //     print(v)
      //   });

        return await usersCollection.find(where.eq("email", userId)).toList();

      } catch(e) {
        print(e);
      }
  }
}
