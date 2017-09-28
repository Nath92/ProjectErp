package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.projecterp.entity.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long>	{

	Account findById(Long id);
	Long countByUsername(String username);
	Account findByUsername(String username);
}
