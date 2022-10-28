package com.sm.api;

public class Student {
	
	private String studName;
	private String studId;
	private String depName;
	private int marks;

	public Student(String studName, String studId, String depName, int marks) {
		super();
		this.studName = studName;
		this.studId = studId;
		this.depName = depName;
		this.marks = marks;
	}

	public String getStudName() {
		return studName;
	}

	public void setStudName(String studName) {
		this.studName = studName;
	}

	public String getStudId() {
		return studId;
	}

	public void setStudId(String studId) {
		this.studId = studId;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((depName == null) ? 0 : depName.hashCode());
		result = prime * result + ((studId == null) ? 0 : studId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (depName == null) {
			if (other.depName != null)
				return false;
		} else if (!depName.equals(other.depName))
			return false;
		if (studId == null) {
			if (other.studId != null)
				return false;
		} else if (!studId.equals(other.studId))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Student [StudName=" + studName + ", StudId=" + studId + ", depName=" + depName + ", marks=" + marks
				+ "]";
	}
	
}
