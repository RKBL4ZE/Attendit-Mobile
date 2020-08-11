mixin Gqlmutation {
  static String loginMutation = '''

    mutation loginMut ( \$userType: String!, \$username: String!, \$password: String!,\$deviceId: String!) {
      login( userType: \$userType, username: \$username, password: \$password, deviceId: \$deviceId) {
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
      SubmitAssignment( id: \$id, file: \$file) {
		 	id
    		earnedMarks
   			remarks
    		status
    		submitFile
    		submitFileName
   			submittedDate
	  }
      
    }

  ''';
}
