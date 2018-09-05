package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private String connectionString = "jdbc:postgresql://localhost:5432/siipatm";
    private String user = "postgres";
    private String pass = "c0ntrasena";
    private String driver = "org.postgresql.Driver";
    private Connection connection;

    public DBConnection() {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(connectionString, user, pass);
        } catch(Exception e) { e.printStackTrace(); }
    }

    public Connection getConnection() { return connection; }
}
