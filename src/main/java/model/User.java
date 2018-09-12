package model;

import javax.xml.bind.annotation.XmlElement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class User {
    private int userId;
    private String username;
    private String password;
    private Student student;
    private String token;

    private DBConnection dbConnection;
    private Connection connection;


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @XmlElement(required = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlElement(required = true)
    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @XmlElement(required = true)
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void validateUser() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM usuario WHERE usuario='"+username+"' AND contrasena='"+password+"'");
            if(resultSet.next()) {
                Access access = new Access();
                token = access.insert(username);
            } else {
                token = "Denied access";
            }
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
