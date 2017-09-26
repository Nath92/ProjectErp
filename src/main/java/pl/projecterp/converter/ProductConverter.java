package pl.projecterp.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.projecterp.entity.Product;
import pl.projecterp.repository.ProductRepository;

public class ProductConverter implements Converter<String, Product> {
	@Autowired
	private ProductRepository productRepository;
	@Override
	public Product convert(String source) {
		Product product = productRepository.findById(Long.parseLong(source));
		return product;
	}
}