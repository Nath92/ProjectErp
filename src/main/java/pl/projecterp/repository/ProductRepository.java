package pl.projecterp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>	{	

	Product findById(Long id);
	List<Product> findByAvailabilityGreaterThan(int availability);
}
