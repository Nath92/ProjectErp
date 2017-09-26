package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>	{	

	
	Order findById(Long id);

}

