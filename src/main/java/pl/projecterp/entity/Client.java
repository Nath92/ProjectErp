package pl.projecterp.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.pl.NIP;

@Entity
@Table(name = "client")
public class Client {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	private String name;
	
	@NIP
	private String nip;
	
	@Size(min = 9)
	private String phone;
	
	@Email
	private String email;
	
	@Size(max = 90)
	private String description;
	
	private boolean active;
	
	@OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
	List<Address> addresses = new ArrayList<>();

	public Client() {};
	
	public Client(String name, String nip, String phone, String email, String description,
			List<Address> addresses) {
		super();
		this.name = name;
		this.nip = nip;
		this.phone = phone;
		this.email = email;
		this.description = description;
		this.addresses = addresses;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", name=" + name + ", nip=" + nip + ", phone=" + phone + ", email=" + email
				+ ", description=" + description;
	}
}
