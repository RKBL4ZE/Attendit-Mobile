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

  static String studentAllDetailsQuery = r'''
  
    query {
      Student {
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

      StudentAssignments {
        id
        facultyId
        classroomId
        subjectCode
        subjectName
        title
        file
        submitFile
        marks
        totalMarks
        status
      }

      StudentAttendance {
        subjectCode
        subjectName
        lecturesAttended
        totalLectures
      }
    }
  
  
  ''';
  static String studentTimeTableQuery = r'''
  
    query{
        StudentTimetable{
          monday{
            time
            subjectName
            facultyName
          }
          tuesday{
            time
            subjectName
            facultyName
          }
          wednesday{
            time
            subjectName
            facultyName
          }
          thursday{
            time
            subjectName
            facultyName
          }
          friday{
            time
            subjectName
            facultyName
          }
          saturday{
            time
            subjectName
            facultyName
          }
        }
    }

  ''';
}

