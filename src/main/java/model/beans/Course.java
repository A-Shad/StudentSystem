package model.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "courses")
public class Course {
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "COURSE_ID")
	private Integer courseId;

	@Column(name = "Course_NAME")
	private String courseName;

	@Column(name = "Description")
	private String courseDescription;

	@OneToMany(mappedBy = "course")
	private Set<Result> result;

	public Set<Result> getResult() {
		return result;
	}

	public void setResult(Set<Result> result) {
		this.result = result;
	}

	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}

	public Course() {
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

} // end class Course