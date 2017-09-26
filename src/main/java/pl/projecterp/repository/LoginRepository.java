package pl.projecterp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.projecterp.entity.Account;

public interface LoginRepository extends JpaRepository<Account, Long>	{

	Account findByUsernameAndPassword(String username, String password); 
}
