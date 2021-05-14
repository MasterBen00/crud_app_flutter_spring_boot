package com.example.crud.model;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Data
@Builder
@Document(collection = "items_data")
public class Product implements Serializable {
	private String id;
	private String title;
	private String description;
}
