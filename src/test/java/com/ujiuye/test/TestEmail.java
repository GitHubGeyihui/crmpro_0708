package com.ujiuye.test;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class TestEmail {
    public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {
        //邮箱的账号和密码
        //邮箱的账号和密码
        final String sendAccount="gyh19981104@163.com";
        String password="Geyihui19981104";
        // 邮箱的授权码
        final String authPass= "geyihui19981104";

        // 设定我们邮件服务器的协议,验证
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol","smtp");//邮件协议smtp
        properties.setProperty("mail.smtp.host","smtp.163.com");// 邮件服务器的地址 163
        properties.setProperty("mail.smtp.auth","true");//是否有验证(授权码)

        //创建一个验证对象
        Authenticator authenticator= new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sendAccount,authPass);
            }
        };
        //构建和邮件服务器之间的会话
        Session session = Session.getInstance(properties,authenticator);
        //显示我们邮件发送的过程
        session.setDebug(true);
        //创建一个消息对象
        MimeMessage message = new MimeMessage(session);
        //设定发件人(发件箱)
        message.setFrom(new InternetAddress(sendAccount));
        //为了避免出现我们的垃圾邮件的拦截，给当前的自己的发件箱抄送一份
        message.addRecipient(Message.RecipientType.CC,new InternetAddress(sendAccount));
        //设定收件箱
        String recvp="gyh19981104@163.com";
        message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(recvp));

        //创建邮件的身体(文本内容,附件)  List集合,容器
        MimeMultipart multipart = new MimeMultipart();

        //邮件主题的一部分
        MimeBodyPart bodyPart = new MimeBodyPart();
        //设置我们的主题文本内容
        bodyPart.setText("不要报invoke错误");
        //将邮件的一部分内容放入到整体容器中  list.add();
        multipart.addBodyPart(bodyPart);

        //添加附件
        String  path="D:\\Desktop\\";
        String  fileName="葛弋辉.docx";
        File file = new File(path+fileName);
        MimeBodyPart bodyPart1 = new MimeBodyPart();
        //通过一个file对象构建一个数据源
        DataSource ds = (DataSource) new FileDataSource(file);
        //将数据源放入到存放数据的对象上
        DataHandler handler = new DataHandler(ds);
        //发送邮件中附件的中文名称处理
        bodyPart1.setFileName(MimeUtility.encodeText(fileName));
        //存放的数据对象设置给bodyPart
        bodyPart1.setDataHandler(handler);
        //bodyPar放入到容器中
        multipart.addBodyPart(bodyPart1);


        //将我们的邮件的主题放入到message上
        message.setContent(multipart);
        //设置邮件的主题
        message.setSubject("自我反思");
        message.setSentDate(new java.util.Date());
        //保存当前消息中的内容
        message.saveChanges();


        //发送消息,获取发送message的对象
        Transport transport = session.getTransport();
        //设定发件人(邮箱账号和密码)
        transport.connect(sendAccount,password);
        //发送我们的消息和设定收件人的地址
        transport.sendMessage(message,message.getAllRecipients());
        //关闭链接
        transport.close();
    }
}
