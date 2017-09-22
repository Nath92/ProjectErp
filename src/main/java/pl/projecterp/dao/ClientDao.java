package pl.projecterp.dao;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import pl.projecterp.entity.Client;

@Component
@Transactional
public class ClientDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	public void add(Client entity) {
		entityManager.persist(entity);
	}
	
	public Collection<String> clientAttributesPl(){
		List<String> clientAttributes = new ArrayList<>();
		clientAttributes.add("Nazwa");
		clientAttributes.add("NIP");
		clientAttributes.add("Kod pocztowy");
		clientAttributes.add("Miasto");
		clientAttributes.add("Ulica");
		clientAttributes.add("Numer domu");
		clientAttributes.add("Numer mieszkania");
		clientAttributes.add("Numer telefonu");
		clientAttributes.add("Email");
		clientAttributes.add("Tag");
		return clientAttributes;
	}
	
	public Collection<String> clientAttributesEn(){
		List<String> clientAttributes = new ArrayList<>();
		clientAttributes.add("name");
		clientAttributes.add("nip");
		clientAttributes.add("postalcode");
		clientAttributes.add("city");
		clientAttributes.add("street");
		clientAttributes.add("housenumber");
		clientAttributes.add("localnumber");
		clientAttributes.add("phonenumber");
		clientAttributes.add("mail");
		clientAttributes.add("tag");
		return clientAttributes;
	}
	
	
	
}
