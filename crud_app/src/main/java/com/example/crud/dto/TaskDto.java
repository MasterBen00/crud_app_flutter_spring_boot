package com.example.crud.dto;

import com.example.crud.enums.Priority;
import com.example.crud.enums.Status;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaskDto implements Serializable {
	private String title;
	private Priority priority;
	private Status status;
	private Long date;
}
