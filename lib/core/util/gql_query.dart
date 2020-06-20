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
        profilePicture
        name
        enrollment
        batch{
          classroom{
            semester
            section
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
  
    query{
        Student{
        batch{
          classroom{
            timetable{
              monday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              tuesday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              wednesday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              thursday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              friday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              saturday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
              }
              sunday{
                startTime
                endTime
                subject{
                  subjectCode
                  subjectName
                }
              faculty{name}
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
    authorName
    authorAvatar
    title
    data
    isLiked
    likesCount
    commentsCount
    postTime
  }  
    }


''';


}



