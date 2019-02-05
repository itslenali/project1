require 'sqlite3'

#TABLE OF CONTENTS:
    # 1) CREATE A NEW RECORD: create(sid_val,
                               # lastname_val,
                               # firstname_val,
                               # major_val,
                               # email_val,
                               # classyr_val,
                               # graduated_val)
    # 2) GET ALL STUDENT RECORDS: all()
    # 3) GET ONE STUDENT RECORD: getStudent(sid)
    # 4) GET ALL STUDENTS WHO EITHER GRADUATED OR DIDN'T: getStudents(binary)
    # 5) EDIT ONE EXISTING STUDENT RECORD: update(sid, new_val)
    # 6) DELETE ONE STUDENT RECORD: destroy(sid)

class DBHandler
    def initialize #constructor method in ruby
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "CREATE TABLE IF NOT EXISTS Students(sid INTEGER PRIMARY KEY,
                                                               lastname   TEXT,
                                                               firstname  TEXT,
                                                               major      TEXT,
                                                               email      TEXT
                                                               class_yr   TEXT
                                                               graduated  INTEGER);"
                                                               #graduated = 1
                                                               #current student = 0
            db.execute dbstatement
        
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def create(sid_val, lastname_val, firstname_val, major_val, email_val, classyr_val, graduated_val)
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "INSERT INTO Students(sid, lastname, firstname, major, email, class_yr, graduated_val)
                           VALUES('#{sid_val}',
                                  '#{lastname_val}',
                                  '#{firstname_val}',
                                   '#{major_val}',
                                   '#{email_val}',
                                   '#{classyr_val}'
                                   '#{graduated_val}');"
            db.execute dbstatement
        
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def all()
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "SELECT  *
                             FROM  Students;"
            db.execute dbstatement
        
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def getStudent(sid) #see one student based on ID
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "SELECT firstname, lastname
                            FROM Students
                            WHERE sid = '#{sid}';"
            db.execute dbstatement
            
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def getStudents(binary) #gets all students who either graduated or didnt
        begin
            db = SQLite3::Database.open "students.db"
            if binary == 0                              #get current student
                dbstatement = "SELECT *
                                FROM Students 
                                WHERE graduated = 0;"
                db.execute dbstatement
            else                                        #get graduated students
                dbstatement = "SELECT *
                                FROM Students 
                                WHERE graduated = 1;"
                db.execute dbstatement
            end
       
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def getStudent(sid) #see one student based on ID
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "SELECT firstname, lastname
                            FROM Students
                            WHERE sid = '#{sid}';"
            db.execute dbstatement
            
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def update(sid, column, new_val)
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "UPDATE  Students
                              SET  #{column} = '#{new_val}'
                            WHERE  sid = '#{sid}';"
            db.execute dbstatement
            
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
    
    def destroy(sid)
        begin
            db = SQLite3::Database.open "students.db"
            dbstatement = "DELETE FROM Students
                           WHERE sid = '#{sid}';"
            db.execute dbstatement
            
        rescue SQLite3::Exception => e
            puts "Exception OCCURRED"
            puts e

        ensure
            db.close if db 
        end
    end
end