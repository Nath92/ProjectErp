package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.projecterp.entity.BasketItem;

public interface BasketItemRepository extends JpaRepository<BasketItem, Long>	{	

	
	BasketItem findById(Long id);

}
