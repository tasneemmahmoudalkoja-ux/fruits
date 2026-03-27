
// Create a global instance (or use GetIt.instance)
import 'package:ecommercefrutes/core/services/firestore_service.dart';
import 'package:ecommercefrutes/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommercefrutes/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
    getIt.registerSingleton<DataBaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
    firebaseAuthService: getIt<FirebaseAuthService>(), 
    dataBaseService: getIt<DataBaseService>(),
    

  
  ));
}