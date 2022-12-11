import 'package:cooking_book/domain/entities/user.dart';

import '../../di/firebae-auth.dart';



  // TODO: implement getUser
  throw UnimplementedError();
}

class RemoteDataSourceRepository {

  const RemoteDataSourceRepository({
    required this.firebaseAuth,
  }): super();

final FirebaseAuthReq firebaseAuth;

@override
  Future getUser(String email, String password) async {
try {
// call firebase auth
// firebaseAuth.email = email;
// firebaseAuth.password = password;
 final dynamic response =  firebaseAuth.createUser(email, password);
  return response;
} catch (e) {
  
}

  }
}
