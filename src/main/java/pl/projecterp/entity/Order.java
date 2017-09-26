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
@Table(name="order")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	private String createdDate;

	@NotBlank
	private String shippingDate;

	@NotBlank
	private String paymentDate;

	@NotNull
	@DecimalMin("0.1")
	private Double totalPrice;
	
//	@ManyToOne
//	private Client client;
	
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	List<OrderItem> items = new ArrayList<>();
	
	public Order() {
	}

	public Order(Long id, String createdDate, String shippingDate, String paymentDate, Double totalPrice, 
			List<OrderItem> orderItem) {
		super();
		this.id = id;
		this.createdDate = createdDate;
		this.shippingDate = shippingDate;
		this.paymentDate = paymentDate;
		this.totalPrice = totalPrice;
//		this.client = client;
		this.items = orderItem;
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

	public List<OrderItem> getOrderItem() {
		return items;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.items = orderItem;
	}
}