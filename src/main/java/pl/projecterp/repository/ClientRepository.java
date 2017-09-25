package pl.projecterp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long>	{	
	
	List<Client> findByName(String name);
	
	Client findById(Long id);
	
	@Query(value = "SELECT * FROM Client WHERE active = 1",
			nativeQuery = true)
	List<Client> findAllActive();
	
	@Query(value = "UPDATE Client SET active = 0 WHERE id = ?1",
			nativeQuery = true)
	void triggerActive(Long id);
	
}