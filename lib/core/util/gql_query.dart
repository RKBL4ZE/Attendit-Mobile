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
      Student{
        name
        enrollment
        email
        address
        gender
        parentName
        profilePicture
        parentEmail
        mobile
        parentMobile
        parentAltMobile
        batch{
          session
          status
          classroom{
            semester
            section
            shift
            course{
              name
            }
          }
        }
      }

      StudentAssignments{
        _id
        title
        faculty{
          name
        }
       
        file
        submitFile
        subject{
          subjectCode
          subjectName
        }
        status
        marks
        totalMarks
        createdAt
        dueDate
      }

      StudentAttendance{
        subject{
          subjectCode
          subjectName
        }
        lecturesAttended
        totalLectures
      }
    }
  
  
  ''';
  static String studentTimeTableQuery = r'''
  
    query {
      Student{
         batch{
          classroom{
            groups{
              id
              timetable{
                monday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                tuesday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                wednesday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                thursday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                friday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                saturday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
                sunday{
                  startTime
                  endTime
                  subject{
                    name
                    fullName
                  }
                  faculty{
                    name
                  }
                }
              }
            }
          }
        }
      }
    }

  ''';


static String newsFeedQuery = r'''

query{
  news{
    id
    author{
      name
      profilePicture
    }
    title
    text
    images
    isLiked
    likesCount
    createdAt
  }
}

''';


}



