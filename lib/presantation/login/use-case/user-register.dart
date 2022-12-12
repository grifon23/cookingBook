import '../../../domain/use-case/create-user.dart';

class UserRegister {
  String email = '';
  String password = '';
  String userId = '';

  UserRegister({required String email, required String password})
      : this.email = email,
        this.password = password;

  FeatureUserUseCase featureUser = FeatureUserUseCase();

  void registerUserUsecase() async {
    featureUser.email = email;
    featureUser.password = password;
    this.userId = await featureUser.getUser();
  }
}
