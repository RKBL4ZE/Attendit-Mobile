mixin Gqlmutation {
  static String loginMutation = '''

    mutation loginMut ( \$userType: String!, \$username: String!, \$password: String!) {
      login( userType: \$userType, username: \$username, password: \$password) {
        iat
        exp
        accesstoken
        refreshtoken
      }
    }

  ''';

  static String refreshMutation = '''

    mutation (\$refreshtoken: String!) {
      refresh(refreshtoken: \$refreshtoken) {
        iat
        exp
        accesstoken
        refreshtoken
      }
    }

  ''';

  static String submitAssignmentMutation = '''

    mutation SubmitAssignmentMut ( \$id: String!, \$file: Upload!) {
      SubmitAssignment( id: \$id, file: \$file) 
      
    }

  ''';
}
