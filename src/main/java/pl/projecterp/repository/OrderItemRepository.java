package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.projecterp.entity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long>	{	

	
	OrderItem findById(Long id);

}
