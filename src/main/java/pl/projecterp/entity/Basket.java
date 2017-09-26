package pl.projecterp.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="basket")
public class Basket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String createdDate;

	@NotBlank
	private String shippingDate;

	@NotBlank
	private String paymentDate;

	@NotNull
	private Double totalPrice;
	
//	@ManyToOne
//	private Client client;
	
	@OneToMany(mappedBy = "basket", cascade = CascadeType.ALL)
	List<BasketItem> items = new ArrayList<>();
	
	public Basket() {
	}

	public Basket(Long id, String createdDate, String shippingDate, String paymentDate, Double totalPrice, List<BasketItem> basketItem) {
		super();
		this.id = id;
		this.createdDate = createdDate;
		this.shippingDate = shippingDate;
		this.paymentDate = paymentDate;
		this.totalPrice = totalPrice;
//		this.client = client;
		this.items = basketItem;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(String shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

//	public Client getClient() {
//		return client;
//	}
//
//	public void setClient(Client client) {
//		this.client = client;
//	}

	public List<BasketItem> getOrderItem() {
		return items;
	}

	public void setOrderItem(List<BasketItem> basketItem) {
		this.items = basketItem;
	}
}