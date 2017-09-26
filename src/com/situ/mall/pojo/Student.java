package  com.situ.mall.pojo;

import java.util.Date;

public class Student {
	private Integer id;
	private String name;
	private Integer age;
	private String gender;
	private String address;
	private Date birthday;
	private Integer banji_id;
	private String bname;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Student(Integer id, String name, Integer age, String gender, String address, Date birthday,
			Integer banji_id) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
		this.banji_id = banji_id;
	}



	public Student(String name, Integer age, String gender, String address, Date birthday, Integer banji_id) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
		this.banji_id = banji_id;
	}




	public Student(Integer id, String name, Integer age, String gender, String address, Date birthday, String bname) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
		this.bname = bname;
	}




	public Student(Integer id, String name, Integer age, String gender, String address, Date birthday) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
	}
	

     

	public Student(Integer id, String name, Integer age, String gender, String address, Date birthday, Integer banji_id,
			String bname) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
		this.banji_id = banji_id;
		this.bname = bname;
	}



	public Student(String name, Integer age, String gender, String address) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}



	public Student(String name, Integer age, String gender, String address, Date birthday) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.birthday = birthday;
	}



	public Student(Integer id, String name, Integer age, String gender, String address) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}

	
	

	public Integer getBanji_id() {
		return banji_id;
	}




	public void setBanji_id(Integer banji_id) {
		this.banji_id = banji_id;
	}




	public String getBname() {
		return bname;
	}


	

	public void setBname(String bname) {
		this.bname = bname;
	}




	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender + ", address=" + address
				+ ", birthday=" + birthday + ", banji_id=" + banji_id + ", bname=" + bname + "]";
	}
	

	
}

