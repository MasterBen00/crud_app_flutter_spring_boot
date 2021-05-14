package com.example.crud.controller;

import com.example.crud.dto.TaskDto;
import com.example.crud.enums.Status;
import com.example.crud.model.Task;
import com.example.crud.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class TaskController {

	private final TaskRepository taskRepository;

	private static int counterForGetAllTasks = 1;
	private static int counterForCreate = 1;
	private static int counterForUpdate = 1;
	private static int counterForDelete = 1;

	@Autowired
	public TaskController(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}

	@GetMapping("/getAllTasks")
	public List<Task> fetchAllProduct() {
		System.out.println("getAllTasks called " + counterForGetAllTasks);
		counterForGetAllTasks++;
		return taskRepository.findAllByOrderByDateDesc();
	}

	@PostMapping("/create")
	public Task createTask(@RequestBody TaskDto taskDto) {
		System.out.println("create called " + counterForCreate);
		counterForCreate++;
		Task task = Task.builder()
				.title(taskDto.getTitle())
				.priority(taskDto.getPriority())
				.status(Status.INCOMPLETE)
				.date(Date.from(Instant.ofEpochMilli(taskDto.getDate())))
				.build();

		return taskRepository.save(task);
	}

	@PatchMapping("/edit")
	public Task updateTask(@RequestParam("id") String id, @RequestBody TaskDto taskDto) {

		System.out.println("update called " + counterForUpdate);
		counterForUpdate++;

		Task task = taskRepository.findById(id).get();
		task.setTitle(taskDto.getTitle());
		task.setPriority(taskDto.getPriority());
		task.setStatus(taskDto.getStatus());
		task.setDate(Date.from(Instant.ofEpochMilli(taskDto.getDate())));

		return taskRepository.save(task);
	}

	@GetMapping("/getTask")
	public Task getTask(@RequestParam("id") String id) {
		return taskRepository.findById(id).get();
	}

	@DeleteMapping("/delete")
	public void deleteTask(@RequestParam("id") String id) {
		System.out.println("delete called " + counterForDelete);
		counterForDelete++;
		taskRepository.deleteById(id);
	}
}
