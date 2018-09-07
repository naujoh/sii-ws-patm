package model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@XmlAccessorType(XmlAccessType.NONE)
@XmlRootElement(name="carrera")
public class Career {
    private int careerId;
    private String name;
    private DBConnection dbConnection;
    private Connection connection;

    @XmlElement(required = true)
    public int getCareerId() {
        return careerId;
    }

    public void setCareerId(int careerId) {
        this.careerId = careerId;
    }

    @XmlElement(required = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCareer() {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Carrera WHERE idCarrera = "+ careerId);
            if(resultSet.next())
                name = resultSet.getString("nombre");
            connection.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
