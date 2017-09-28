package pl.projecterp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import pl.projecterp.validator.Postalcode;

@Entity
@Table(name = "address")
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	@Postalcode
	private String postalcode;
	
	@NotBlank
	private String province;
	
	@NotBlank
	private String city;
	
	@NotBlank
	private String street;
	
	@NotBlank
	private String housenumber;
	
	private Integer localnumber;
	
	@ManyToOne
	private Client client;
	
	public Address() {};
	
	public Address(Long id, String postalcode, String province, String city, String street, String housenumber,
			Integer localnumber, Client client) {
		super();
		this.id = id;
		this.postalcode = postalcode;
		this.province = province;
		this.city = city;
		this.street = street;
		this.housenumber = housenumber;
		this.localnumber = localnumber;
		this.client = client;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getHousenumber() {
		return housenumber;
	}

	public void setHousenumber(String housenumber) {
		this.housenumber = housenumber;
	}

	public Integer getLocalnumber() {
		return localnumber;
	}

	public void setLocalnumber(Integer localnumber) {
		this.localnumber = localnumber;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	@Override
	public String toString() {
		return "<tr><td>" + postalcode + "</td><td>" + province + "</td><td>" + city
				+ "</td><td>" + street + "</td><td>" + housenumber + "</td><td>" + localnumber + "</td></tr>";
	}
	
}
