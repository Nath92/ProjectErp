package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Basket;

@Repository
public interface BasketRepository extends JpaRepository<Basket, Long>	{	

	
	Basket findById(Long id);

}

