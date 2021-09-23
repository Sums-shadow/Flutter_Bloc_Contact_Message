import 'dart:math';

import 'package:contacta/model/contact.model.dart';

class ContactRepository {
  Map<int, Contact> contacts = {
    1: Contact(
        id: 1, name: "Ngbowa", profil: "NG", score: 1234, type: "Student"),
    2: Contact(
        id: 2, name: "Mulongo", profil: "MGG", score: 456, type: "Student"),
    3: Contact(
        id: 3, name: "Kiala", profil: "RK", score: 789, type: "Developer"),
    4: Contact(
        id: 4, name: "Mulumba", profil: "MM", score: 147, type: "Student"),
    4: Contact(
        id: 4, name: "Iwaku", profil: "IW", score: 852, type: "Developer"),
  };

  Future<List<Contact>> allContact() async {
    var fut = await Future.delayed(Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if (rnd > 3) {
      return contacts.values.toList();
    } else {
      throw new Exception("Internet failed");
    }
  }
  Future<List<Contact>> contactByType(String type) async {
    var fut = await Future.delayed(Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if (rnd > 3) {
      return contacts.values.toList().where((element) => element.type == type).toList();
    } else {
      throw new Exception("Internet failed");
    }
  }
}
