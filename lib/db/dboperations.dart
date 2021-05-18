import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinitescrolladspayment/db/models/emp.dart';

class DbOperation {
  static DbOperation _db = DbOperation();
  final dbReference = Firestore.instance;

  static getInstance() {
    return _db;
  }

  addEmp(int id, String name, double salary) async {
    Emp emp = Emp(id, name, salary);
    DocumentReference ref =
        await dbReference.collection('emps').add(emp.convertToMap());
    print('Record added ${ref.documentID}');
  }

  DocumentSnapshot lastDocument = null;
  List<DocumentSnapshot> empList = [];
  Future<List<DocumentSnapshot>> getPaginateRecords(int records) async {
    QuerySnapshot result;
    if (lastDocument == null) {
      Query query =
          dbReference.collection('emps').orderBy('name').limit(records);
      result = await query.getDocuments();
      if (result.documents.length > 0) {
        lastDocument = result.documents[result.documents.length - 1];
      }
    } else {
      Query query = dbReference
          .collection('emps')
          .orderBy('name')
          .startAfter([lastDocument.data['name']])
          .limit(records);
      result = await query.getDocuments();
      if (result.documents.length > 0) {
        lastDocument = result.documents[result.documents.length - 1];
      }
    }
    if (result.documents.length == 0) {
      return empList;
    }
    empList.addAll(result.documents);
    return empList;
  }
}
