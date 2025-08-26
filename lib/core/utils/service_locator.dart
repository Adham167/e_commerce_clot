import 'package:e_commerce_clot/features/authintication/data/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/data/repo/user_auth_repo_impl.dart';
import 'package:e_commerce_clot/features/authintication/data/source/auth_firebase_service.dart';
import 'package:e_commerce_clot/features/authintication/data/source/auth_firebase_service_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> ServiceLocator() async {
  //services

  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //repositories
  getIt.registerSingleton<UserAuthRepo>(UserAuthRepoImpl());
  //usecases
}
