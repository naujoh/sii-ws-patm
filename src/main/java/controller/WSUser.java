package controller;

import model.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/usuario")
public class WSUser {

    @GET
    @Path("/login/{usr}/{pwd}")
    @Produces(MediaType.APPLICATION_JSON)
    public User login(@PathParam("usr") String usr, @PathParam("pwd") String pwd) {
        User user = new User();
        user.setUsername(usr);
        user.setPassword(pwd);
        user.validateUser();
        return user;
    }
}
