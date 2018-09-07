package model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@XmlAccessorType(XmlAccessType.NONE)
@XmlRootElement(name="alumno")
public class Student {

    private int studentId;
    private String name;
    private String firstLastName;
    private String secondLastName;
    private String email;
    private String controlNumber;
    private Career career;
    private DBConnection dbConnection;
    private Connection connection;


    @XmlElement(required = true)
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @XmlElement(required = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElement(required = true)
    public String getFirstLastName() {
        return firstLastName;
    }

    public void setFirstLastName(String firstLastName) {
        this.firstLastName = firstLastName;
    }

    @XmlElement(required = true)
    public String getSecondLastName() {
        return secondLastName;
    }

    public void setSecondLastName(String secondLastName) {
        this.secondLastName = secondLastName;
    }

    @XmlElement(required = true)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlElement(required = true)
    public String getControlNumber() {
        return controlNumber;
    }

    public void setControlNumber(String controlNumber) {
        this.controlNumber = controlNumber;
    }

    @XmlElement(required = true)
    public Career getCareer() {
        return career;
    }

    public void setCareer(Career career) {
        this.career = career;
    }

    public void insert() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        String query = "INSERT INTO Alumno(noControl, nombre, apePaterno, apeMaterno, email, idCarrera) " +
                "values('"+controlNumber+"','"+name+"','"+firstLastName+"','"+secondLastName+"','"+email+"',"+career.getCareerId()+")";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void update() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE Alumno SET noControl = '"+controlNumber+"', nombre = '"+name+"', " +
                    "apePaterno='"+firstLastName+"', " + "apeMaterno='"+secondLastName+"', email='"+email+"', " +
                    "idCarrera = "+ career.getCareerId() + " WHERE idAlumno = " + studentId);
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void delete() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM Alumno WHERE idAlumno="+studentId);
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Student> getStudents() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        ArrayList<Student> students = null;
        Student student;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Alumno ORDER BY nombre");
            students = new ArrayList<>();
            while(resultSet.next()) {
                student = new Student();
                student.studentId = resultSet.getInt("idAlumno");
                student.controlNumber = resultSet.getString("noControl");
                student.name = resultSet.getString("nombre");
                student.firstLastName = resultSet.getString("apePaterno");
                student.secondLastName = resultSet.getString("apeMaterno");
                student.email = resultSet.getString("email");
                student.career = new Career();
                student.career.setCareerId(resultSet.getInt("idCarrera"));
                student.career.setCareer();
                students.add(student);
            }
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
        return students;
    }
}