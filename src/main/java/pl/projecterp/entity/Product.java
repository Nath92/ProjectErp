package pl.projecterp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.json.JSONObject;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	private String name;

	@NotNull
	@Min(value=0)
	private Integer standard;

	@NotNull
	@Min(value=0)
	private Integer availability;

	@NotNull
	@DecimalMin("0.0")
	private Double weight;

	@NotNull
	@DecimalMin("0.0")
	private Double currentPrice;

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

	public Integer getStandard() {
		return standard;
	}

	public void setStandard(Integer standard) {
		this.standard = standard;
	}

	public Integer getAvailability() {
		return availability;
	}

	public void setAvailability(Integer availability) {
		this.availability = availability;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(Double currentPrice) {
		this.currentPrice = currentPrice;
	}
	
	public JSONObject toJSON() {
		JSONObject jo = new JSONObject();
		jo.put("id", id);
		jo.put("name", name);
		jo.put("standard", standard);
		jo.put("availability", availability);
		jo.put("weight", weight);
		jo.put("currentPrice", currentPrice);
		
		return jo;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", standard=" + standard + ", availability=" + availability
				+ ", weight=" + weight + ", currentPrice=" + currentPrice + "]";
	}
	
}