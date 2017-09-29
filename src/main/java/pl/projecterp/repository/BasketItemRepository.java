package pl.projecterp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.projecterp.entity.BasketItem;

public interface BasketItemRepository extends JpaRepository<BasketItem, Long>	{	

	
	BasketItem findById(Long id);
	List<BasketItem> findByBasketId(Long id);
}
