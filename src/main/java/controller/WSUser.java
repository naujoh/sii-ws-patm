package controller;

import model.Server;
import model.Student;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

@Path("/usuario")
public class WSUser {

    @GET
    @Path("/login/{usr}/{pwd}")
    @Produces(MediaType.APPLICATION_JSON)
    public User login(@PathParam("usr") String usr, @PathParam("pwd") String pwd, @Context HttpServletRequest request) {
        User user = new User();
        user.setUsername(usr);
        user.setPassword(pwd);
        user.validateUser(request);
        return user;
    }
}
