package model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Access {
    private int accessId;
    private Date init_date;
    private Date end_date;
    DBConnection dbConnection;
    Connection connection;

    public int getAccessId() {
        return accessId;
    }

    public void setAccessId(int accessId) {
        this.accessId = accessId;
    }

    public Date getInit_date() {
        return init_date;
    }

    public void setInit_date(Date init_date) {
        this.init_date = init_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String insert(String username) {
        String token;
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            token = generateToken(username);
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO accesos(token, fecha_inicio, fecha_fin) " +
                    "values('"+token+"', now(), now() + interval '30 minutes')");
        } catch (Exception e) { e.printStackTrace(); token = "Access error"; }
        return token;
    }

    private String generateToken(String username) {
        String token = "";
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String string = dateFormat.format(date)+username;

            byte[] digest = null;
            byte[] buffer = string.getBytes();

            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(buffer);
            digest = messageDigest.digest();

            token = toHexadecimal(digest);

        }catch (NoSuchAlgorithmException ex){ ex.printStackTrace(); }
        return token;
    }

    private static String toHexadecimal(byte[] digest) {
        String hash = "";
        for(byte aux : digest) {
            int b = aux & 0xff;
            if (Integer.toHexString(b).length() == 1) hash += "0";
            hash += Integer.toHexString(b);
        }
        return hash;
    }

    public boolean validateToken(String token) {
        dbConnection = new DBConnection();
        connection = dbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM accesos WHERE token = '"+token+"' AND now() BETWEEN fecha_inicio AND fecha_fin");
            if(resultSet.next()) {
                connection.close();
                return true;
            } else {
                connection.close();
                return false;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }
}
