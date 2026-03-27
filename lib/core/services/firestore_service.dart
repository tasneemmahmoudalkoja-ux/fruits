import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService implements DataBaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String collictionName, required Map<String, dynamic> data,String? docId})async {
    if(docId !=null){
        await firestore.collection(collictionName).doc(docId).set(data);

    }
    else{
        await firestore.collection(collictionName).add(data);

    }
  }
  
  @override
  Future<Map<String,dynamic>> getData({required String collictionName,required String userId}) async{
   var data= await firestore.collection(collictionName).doc(userId).get();
   return data.data() as Map<String,dynamic>;

  }
  
  @override
  Future<bool> checkIfDataExists({required String collectionName, required String documentId}) async{
    var data =await firestore.collection(collectionName).doc(documentId).get();
    return data.exists;
  }

}
abstract class DataBaseService{
  Future<void>addData({required String collictionName,required Map<String,dynamic>data,String?docId});
  Future<Map<String,dynamic>>getData({required String collictionName,required String userId});
  Future<bool>checkIfDataExists({required String collectionName,required String documentId});
}