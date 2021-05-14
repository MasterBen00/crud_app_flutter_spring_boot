package com.example.crud.model;

import com.example.crud.enums.Priority;
import com.example.crud.enums.Status;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

@Data
@Builder
@Document(collection = "tasks_data")
public class Task implements Serializable {
	@Id
	private String id;
	private String title;
	private Priority priority;
	private Status status;
	private Date date;
}
