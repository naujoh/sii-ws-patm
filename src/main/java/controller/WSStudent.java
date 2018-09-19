package controller;

//endpoint: http://localhost:8080/ws-sii-patm/---/[controller]

import model.Access;
import model.Student;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/alumno")
public class WSStudent {

    @POST
    @Path("/{token}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Student insert(Student student, @PathParam("token") String token) {
        Access access = new Access();
        if(access.validateToken(token))
            student.insert();
        else
            student.setName("Acceso denegado");
        return student;
    }

    @PUT
    @Path("/{token}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void update(Student student, @PathParam("token") String token) {
        Access access = new Access();
        if(access.validateToken(token))
            student.update();
    }

    @DELETE
    @Path("/{student_id}/{token}")
    public void delete(@PathParam("student_id") int studentId, @PathParam("token") String token) {
        Student student = new Student();
        Access access = new Access();
        if(access.validateToken(token)) {
            student.setStudentId(studentId);
            student.delete();
        }
    }

    @GET
    @Path("/lista/{token}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> getListOfStudents(@PathParam("token") String token) {
        Student student = new Student();
        Access access = new Access();
        if(access.validateToken(token))
            return student.getStudents();
        else
            return null;
    }
}
