package pl.projecterp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "basketItem")
public class BasketItem {

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
	private Integer quantity;

	@NotNull
	@DecimalMin("0.0")
	private Double weight;

	@NotNull
	@DecimalMin("0.0")
	private Double price;

	@NotNull
	private Long productId;
	
	@ManyToOne
	private Basket basket;
	
	public BasketItem() {
	}

	public BasketItem(Long id, String name, Integer standard, Integer quantity, Double weight, Double price, Long productId,
			Basket basket) {
		super();
		this.id = id;
		this.name = name;
		this.standard = standard;
		this.quantity = quantity;
		this.weight = weight;
		this.price = price;
		this.productId = productId;
		this.basket = basket;
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
	
	public Integer getStandard() {
		return standard;
	}

	public void setStandard(Integer standard) {
		this.standard = standard;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Basket getBasket() {
		return basket;
	}

	public void setBasket(Basket basket) {
		this.basket = basket;
	}

	@Override
	public String toString() {
		return "BasketItem [id=" + id + ", name=" + name + ", standard=" + standard + ", quantity=" + quantity
				+ ", weight=" + weight + ", price=" + price + "]";
	}
	
}