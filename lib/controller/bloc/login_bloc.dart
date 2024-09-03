import 'dart:async';
import 'dart:convert';

import 'package:allison/data/network/api_urls.dart';
import 'package:allison/data/shared_preference/shared_pref.dart';
import 'package:allison/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(loginUser);
  }

  FutureOr<void> loginUser(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    Map<String, String> header = {"Content-Type": "application/json"};

    try {
      emit(LoginLoadingState());
      final url = Uri.parse(
          '${ApiUrls.baseUrl}/login?email_phone=${event.phone}&password=${event.password}');
      final response = await http.post(url, headers: header);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        UserModel userData = UserModel.fromJson(responseBody);
        SharedPref.instance.storeToken(userData.customerdata.token);
        emit(LoginSuccessState());
      }
    } catch (e) {
      emit(LoginErrorState(message: 'Login Failed'));
    }
  }
}
