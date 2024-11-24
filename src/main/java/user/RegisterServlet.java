package user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String role = request.getParameter("role");

        System.out.println("RegisterServlet - ID: " + id);
        System.out.println("RegisterServlet - Password: " + password);
        System.out.println("RegisterServlet - Name: " + name);
        System.out.println("RegisterServlet - Role: " + role);

        UserDO user = new UserDO();
        user.setId(id);
        user.setPassword(password);
        user.setName(name);
        user.setRole(role);

        UserDAO userDao = new UserDAO();
        userDao.insertUser(user);

        response.sendRedirect("register_success.jsp");
    }
}
