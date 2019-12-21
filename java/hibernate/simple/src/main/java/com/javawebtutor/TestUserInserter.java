package com.javawebtutor;
 
import java.util.Date;
 
import org.hibernate.Session;

/***
 * This class inserts test Users.
 */
public class TestUserInserter {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
 
        session.beginTransaction();
        User user = new User();
 
        user.setUserId(1);
        user.setUsername("Mukesh");
        user.setCreatedBy("Google");
        user.setCreatedDate(new Date());
 
        session.save(user);
        session.getTransaction().commit();
 
    }
 
}