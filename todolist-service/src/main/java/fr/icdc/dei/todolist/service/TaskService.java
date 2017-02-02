package fr.icdc.dei.todolist.service;

import java.util.List;
import fr.icdc.dei.todolist.persistence.entity.Task;

public interface TaskService {

	List<Task> list();

	Task add(Task task);

	List<Task> listsTasksNotEndedBetween(Date startingD, Date endingD);

	void endTasksNotEnded(List<Task> tasksNotEnded);

}
