import 'package:dartz/dartz.dart';

import '../network/network_exceptions.dart';

typedef FutureEither<T> = Future<Either<NetworkExceptions, T>>;
typedef FutureVoid = FutureEither<void>;