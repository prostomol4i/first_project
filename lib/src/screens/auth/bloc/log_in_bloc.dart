import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../common/models/tokens_model.dart';
import '../../../common/models/user_model.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final Dio dio;
  final Box tokensBox = Hive.box('tokens');
  final Box userBox = Hive.box('user');
  LogInBloc({
    required this.dio,
  }) : super(LogInInitial()) {
    on<LogInPressed>((event, emit) async {
      emit(LogInLoading());

      try {
        Response response = await dio.post(
          'auth/login',
          data: {
            "email": event.email,
            "password": event.password,
          },
        );
        UserModel userModel = UserModel.fromJson(
          response.data['user'],
        );
        userBox.put('id', userModel.id);
        userBox.put('email', userModel.email);
        userBox.put('nickname', userModel.nickname);

        TokensModel tokensModel = TokensModel.fromJson(
          response.data['tokens'],
        );
        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);

        emit(LogInLoaded());
      } on DioError catch (e) {
        emit(LogInFailed(message: 'Неправильный логин или пароль'));
        rethrow;
      } catch (e) {
        emit(LogInFailed(message: 'Произошла ошибка'));
        rethrow;
      }
    });
  }
}
