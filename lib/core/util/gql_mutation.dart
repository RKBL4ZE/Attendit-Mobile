mixin Gqlmutation {
  static String loginMutation = '''

    mutation loginMut (\$prefix: String!, \$userType: String!, \$username: String!, \$password: String!) {
      login(prefix: \$prefix, userType: \$userType, username: \$username, password: \$password) {
        accesstoken
        refreshtoken
      }
    }

  ''';

  static String refreshMutation = '''

    mutation (\$refreshtoken: String!) {
      refresh(refreshtoken: \$refreshtoken) {
        accesstoken
        refreshtoken
      }
    }

  ''';
}
