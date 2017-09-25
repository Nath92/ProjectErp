package pl.projecterp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.projecterp.entity.Address;
import pl.projecterp.entity.Client;

public interface AddressRepository extends JpaRepository<Address, Long>{

	List<Address> findByClient(Client client);
	Address findById(Long id);
}
