
import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/firebase_service/firestore_helper.dart';
import 'package:demo/firebase_service/firestore_helper_impl.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

void setupDependency() {
  dependency.registerLazySingleton<FireStoreHelper>(() => FireStoreHelperImpl());
  dependency.registerFactory<HomeScreenBloc>(() => HomeScreenBloc(dependency()));
}