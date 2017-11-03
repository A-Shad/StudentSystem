package model.dao;

import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;

import com.itextpdf.text.DocumentException;

import model.beans.EmailBean;


public interface DAOEmailInterface {
	
	public void emailSend(EmailBean email, String action);
	
	public void writePdf(EmailBean email, OutputStream outputStream) throws ClassNotFoundException, DocumentException, MalformedURLException, IOException;
}
