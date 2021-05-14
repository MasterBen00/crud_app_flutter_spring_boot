package com.example.crud.controller;

import com.example.crud.model.Product;
import com.example.crud.dto.ProductDto;
import com.example.crud.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProductController {
	private final ProductRepository productRepository;

	@Autowired
	public ProductController(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@GetMapping("/fetchAll")
	public List<Product> fetchAllProduct() {
		System.out.println(9);

		return productRepository.findAll();
	}

	@PostMapping("/create")
	public Product createProduct(@RequestBody ProductDto productDto) {
		Product product = Product.builder()
				.title(productDto.getTitle())
				.description(productDto.getDescription())
				.build();

		return productRepository.save(product);
	}

	@PostMapping("/edit/{id}")
	public Product editProduct(@PathVariable("id") String id,@RequestBody ProductDto productDto) {
		Product product = productRepository.findById(id).get();
		product.setTitle(productDto.getTitle());
		product.setDescription(productDto.getDescription());

		return productRepository.save(product);
	}

	@GetMapping("/fetch/{id}")
	public Product fetchProduct(@PathVariable("id") String id) {

		return productRepository.findById(id).get();
	}

	@DeleteMapping("/delete/{id}")
	public void deleteProduct(@PathVariable("id") String id) {

		productRepository.deleteById(id);
	}
}
