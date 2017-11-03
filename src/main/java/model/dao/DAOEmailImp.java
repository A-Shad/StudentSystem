package model.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.hibernate.Hibernate;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfWriter;

import model.beans.EmailBean;
import model.beans.LoginSystem;

@Repository
@Transactional
public class DAOEmailImp extends HibernateUtil implements DAOEmailInterface {

	@Override
	public void emailSend(EmailBean email, String action) {

		String userName = email.getUsername();

		final String password = email.getPassword();
		final String user = email.getEmailFrom();
		String smtpHost = "smtp.gmail.com"; // replace this with a valid host
		int smtpPort = 587; // replace this with a valid port

		String recipient = email.getEmailTo(); // replace this with a valid recipient email address
		String content = email.getEmailBody();
		String subject = email.getEmailTitle();

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", smtpHost);
		properties.put("mail.smtp.port", smtpPort);

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		ByteArrayOutputStream outputStream = null;

		try {
			// construct the text body part
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(content);

			// now write the PDF content to the output stream
			outputStream = new ByteArrayOutputStream();
			MimeMultipart mimeMultipart = new MimeMultipart();
			if (action.equals("resultOne")) {
				writePdf(email, outputStream);
				byte[] bytes = outputStream.toByteArray();

				// construct the pdf body part
				DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");
				MimeBodyPart pdfBodyPart = new MimeBodyPart();
				pdfBodyPart.setDataHandler(new DataHandler(dataSource));
				pdfBodyPart.setFileName("mark.pdf");
				mimeMultipart.addBodyPart(pdfBodyPart);
			}

			mimeMultipart.addBodyPart(textBodyPart);

			// create the sender/recipient addresses
			InternetAddress iaSender = new InternetAddress(user);
			InternetAddress iaRecipient = new InternetAddress(recipient);

			// construct the mime message
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setSender(iaSender);
			mimeMessage.setSubject(subject);
			mimeMessage.setRecipient(Message.RecipientType.TO, iaRecipient);
			mimeMessage.setContent(mimeMultipart);

			// send off the email
			Transport.send(mimeMessage);

			System.out.println(
					"sent from " + user + ", to " + recipient + "; server = " + smtpHost + ", port = " + smtpPort);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// clean off
			if (null != outputStream) {
				try {
					outputStream.close();
					outputStream = null;
				} catch (Exception ex) {
				}
			}
		}

	}

	@Override
	public void writePdf(EmailBean email, OutputStream outputStream)
			throws ClassNotFoundException, DocumentException, MalformedURLException, IOException {
		{

			Font regular = new Font(FontFamily.HELVETICA, 14, Font.BOLDITALIC);
			Font title1 = new Font(FontFamily.HELVETICA, 22, Font.BOLD);
			Font title2 = new Font(FontFamily.HELVETICA, 18, Font.BOLD);

			Class cls = Class.forName("model.beans.EmailBean");
			ClassLoader cLoader = cls.getClassLoader();
			URL logo = cLoader.getResource("montrealCollege.png");

			Image img = Image.getInstance(logo);

			Document document = new Document();
			PdfWriter.getInstance(document, outputStream);
			document.open();
			document.add(img);
			String s1 = "Transcript for Course: " + email.getCourseName() + " for Semester, Year: "
					+ email.getSemester() + " , " + email.getYear();
			Paragraph p = new Paragraph(s1, title1);
			p.setAlignment(Element.ALIGN_CENTER);
			document.add(p);
			Paragraph p20 = new Paragraph();
			p20.add("=========================================================================");
			document.add(p20);
			Paragraph p21 = new Paragraph();
			p21.add("                                                                                         ");
			document.add(p21);

			String s2 = "Student: " + email.getFirstName() + " " + email.getLastName() + " ,Student ID: "
					+ email.getStudentId();
			Paragraph p2 = new Paragraph(s2, title2);
			p.setAlignment(Element.ALIGN_CENTER);

			document.add(p2);

			Paragraph p3 = new Paragraph();
			p3.add("-----------------------------------------------------------------------------------------------------------");
			document.add(p3);
			Paragraph p30 = new Paragraph();
			p30.add("                                                                                         ");
			document.add(p30);

			String s4 = " Mid-Term result: " + Math.round(email.getExamMidterm() * 100.0) / 100.0;
			Paragraph p4 = new Paragraph(s4, regular);
			document.add(p4);

			String s5 = " Final-Term result: " + Math.round(email.getExamFinal() * 100.0) / 100.0;
			Paragraph p5 = new Paragraph(s5, regular);
			document.add(p5);

			document.close();

		}

	}
}
