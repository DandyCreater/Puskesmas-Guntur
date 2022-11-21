import 'package:get_it/get_it.dart';
import 'package:puskesmas_guntur/data/datasources/local_data_sources.dart';
import 'package:puskesmas_guntur/data/datasources/remote_data_sources.dart';
import 'package:puskesmas_guntur/data/repository/data_repository_impl.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';
import 'package:puskesmas_guntur/domain/usecase/article/article_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/forgotpasswrod_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/signIn_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/signUp_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/carousel/carousel_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/hospital/hospital_usecase.dart';
import 'package:puskesmas_guntur/domain/usecase/pelayanan/pelayanan_usecase.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/carousel-Bloc/carousel_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/forgotpassword-Bloc/forgotpassword_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/hospital-Bloc/hospital_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/pelayanan-Bloc/pelayanan_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signUp-Bloc/sign_up_bloc.dart';

final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
  //Bloc
  sl.registerFactory(() => ArticleBloc(sl()));
  sl.registerFactory(() => CarouselBloc(sl()));
  sl.registerFactory(() => HospitalBloc(sl()));
  sl.registerFactory(() => PelayananBloc(sl()));
  sl.registerFactory(() => SignInBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => SignUpBloc(sl()));
  sl.registerFactory(() => ForgotpasswordBloc(sl()));

  //UseCase
  sl.registerLazySingleton(() => ArticleUseCase(sl()));
  sl.registerLazySingleton(() => CarouselUseCase(sl()));
  sl.registerLazySingleton(() => HospitalUseCase(sl()));
  sl.registerLazySingleton(() => PelayananUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => FacebookSignInUseCase(sl()));
  sl.registerLazySingleton(() => GoogleSignInUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));

  //Repository
  sl.registerLazySingleton<DomainRepository>(() =>
      DataRepositoryImpl(remoteDataSources: sl(), localDataSources: sl()));

  //DataSources
  sl.registerLazySingleton<LocalDataSources>(() => LocalDataSourcesImpl());
  sl.registerLazySingleton<RemoteDataSources>(() => RemoteDataSourcesImpl());
}
