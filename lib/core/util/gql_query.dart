mixin Gqlquery {
  static String studentDetailsQuery = r'''
  
  query{
    Student{
      enrollment
      name
      email
      profilePicture
      mobile
      gender
      section
      session
      shift
      parentName
      parentMobile
      parentAltMobile
      parentEmail
      address
      semesterId
      courseId
      semesterName
      courseName
      classroomId
    }
}
  
  ''';
}

