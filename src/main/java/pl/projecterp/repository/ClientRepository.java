package pl.projecterp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long>	{	
	
	List<Client> findByName(String name);
	Client findById(Long id);
}