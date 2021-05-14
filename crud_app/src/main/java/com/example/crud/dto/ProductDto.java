package com.example.crud.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProductDto implements Serializable {
	private String title;
	private String description;
}
