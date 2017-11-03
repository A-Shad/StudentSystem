package model.beans;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "results")
public class Result {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "RESULT_ID")
	private int resultId;

	@Column(name = "EXAM_MIDTERM")
	private double examMidterm;

	@Column(name = "EXAM_FINAL")
	private double examFinal;

	@Column(name = "SEMESTER")
	private int semester;

	@Column(name = "YEAR")
	private int year;

	@Column(name = "USERNAME")
	private String userName;

	@ManyToOne
	@JoinColumn(name = "STUDENT_ID")
	private Student student;

	@ManyToOne
	@JoinColumn(name = "COURSE_ID")
	private Course course;
	//

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getResultId() {
		return resultId;
	}

	public void setResultId(int resultId) {
		this.resultId = resultId;
	}

	public double getExamMidterm() {
		return examMidterm;
	}

	public void setExamMidterm(double examMidterm) {
		this.examMidterm = examMidterm;
	}

	public double getExamFinal() {
		return examFinal;
	}

	public void setExamFinal(double examFinal) {
		this.examFinal = examFinal;
	}

	public Result() {
	}

} // end class Result