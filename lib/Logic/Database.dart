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
      db.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerHospital(hospitalData) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var hosCollection = db.collection('hospitals');

      await hosCollection.insert(hospitalData);
      db.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerDoctor(doctorData) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var docCollection = db.collection('doctors');

      await docCollection.insert(doctorData);
      db.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getUserDetails(userId) async {
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
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getLocations() async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('doctors');

      // await usersCollection
      // .find(where.eq("email", userId)).forEach((v) => {
      //     print(v)
      //   });

      return await usersCollection.find().toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getNearDoctors(city, spes) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('doctors');

      return await usersCollection
       .find(where.eq("speciality", spes).eq("city", city)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getHistory(name) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('appoinments');

      return await usersCollection
       .find(where.eq("username", name).eq("completed", true)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getHospitals() async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('hospitals');

      return await usersCollection
       .find().toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getDoctors() async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('doctors');

      return await usersCollection
       .find().toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getUpcomming(name) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('appoinments');

      return await usersCollection
       .find(where.eq("username", name).eq("completed", false)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> updateUser(userData, email) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('users');

      var v1 = await usersCollection.findOne({"email": email});
      v1["username"] = userData["username"];
      v1["password"] = userData["password"];
      v1["first_name"] = userData["first_name"];
      v1["last_name"] = userData["last_name"];
      v1["nic"] = userData["nic"];
      v1["dob"] = userData["dob"];
      v1["email"] = userData["email"];
      v1["mobile"] = userData["mobile"];
      v1["emergency_no"] = userData["emergency_no"];
      v1["phy_dis"] = userData["phy_dis"];
      v1["med_alergy"] = userData["med_alergy"];
      await usersCollection.save(v1);
      db.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> makeAppoinment(appinmentData, name) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('appoinments');

//      var v1 = await usersCollection.findOne(where.eq("name", name));
//      v1["appoinments"] = {appinmentData};
//      await usersCollection.save(v1);

//      await usersCollection.update(v1,{"\$set": {"appoinments": {"djksaash":"aa"}}});
//      await usersCollection.update(v1,{"appoinments": ""});
      await usersCollection.insert(appinmentData);

      db.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      print("Connecting");
      Db db = new Db("mongodb://10.0.2.2:27017/healthcare");
      await db.open();
      print("Database Connected");

      var usersCollection = db.collection('users');

      var v = await usersCollection.findOne(where.eq("email", email));

      if (v == null) {
        return false;
      } else {
        if (v["password"] == password) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
