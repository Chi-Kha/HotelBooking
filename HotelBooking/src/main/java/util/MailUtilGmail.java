
package util;


import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class MailUtilGmail {
    public static void SendMail(String to,String from,String subject,String body,boolean bodyIsHTML)
            throws MessagingException{
        Properties pros=new Properties();
        pros.put("mail.transport.protocol","smtps");
        pros.put("mail.smtps.host","smtp.gmail.com");
        pros.put("mail.smtps.port",465);
        pros.put("mail.smtps.auth","true");
        pros.put("mail.smtps.quitwait","false");
        Session session=Session.getDefaultInstance(pros);
        session.setDebug(true);
        
        Message message=new MimeMessage(session);
        message.setSubject(subject);
        if(bodyIsHTML){
            message.setContent(body,"text/html");
        }else{
            message.setText(body);
            
        }
        Address fromAddress=new InternetAddress(from);
        Address toAddress=new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);
        
        Transport transport= session.getTransport();
        transport.connect("kha.dang.2191992@gmail.com","wjnbo1992");
        transport.sendMessage(message,message.getAllRecipients());
        transport.close();
    }
    
}
