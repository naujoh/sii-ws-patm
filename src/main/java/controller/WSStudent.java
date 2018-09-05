package controller;

//endpoint: http://localhost:8080/ws-sii-patm/---/[controller]

import model.Student;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/ws-alumno")
public class WSStudent {

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Student insert(Student student) {
        student.insert();
        return student;
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void update(Student student) {
        student.update();
    }

    @DELETE
    @Path("/{student_id}")
    public void delete(@PathParam("student_id") int studentId) {
        Student student = new Student();
        student.setStudentId(studentId);
        student.delete();
    }

    @GET
    @Path("/students")
    public List<Student> getListOfStudents() {
        Student student = new Student();
        return student.getStudents();
    }
}
