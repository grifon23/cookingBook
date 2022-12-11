import 'package:cooking_book/domain/models/get-user-id.dart';

class UserEntity implements UserId {
  const UserEntity({
    this.userId = '',
  });

  @override
  final String userId;
}
