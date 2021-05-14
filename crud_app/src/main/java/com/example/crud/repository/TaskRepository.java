package com.example.crud.repository;

import com.example.crud.model.Task;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends MongoRepository<Task, String> {
	List<Task> findAllByOrderByDateDesc();
}
