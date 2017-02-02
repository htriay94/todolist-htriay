package fr.icdc.dei.todolist.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.icdc.dei.todolist.persistence.dao.TaskDao;
import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.service.TaskService;

@Service("TaskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	private TaskDao taskDao;

	@Override
	public List<Task> list() {
		return taskDao.findAll();
	}

	@Override
	public Task add(Task task) {
		if(task.getUser().getTasks().size() < 10)
			return taskDao.save(task);
		return null;
	}

	@Override
	public List<Task> listsTasksNoEndedBetween(Date startingD, Date endingD) {
		// startingDate < endingDate
		if(startingD.compareTo(endingD) < 0)
			return taskDao.findAllByBeginningDateAndEndingDateBetween(startingD,endingD);
		return null;
	}

	@Override
	public void endTasksNotEnded(List<Task> tasksNotEnded) {
		Date date = new Date();
		SimpleDateFormat dateNow = new SimpleDateFormat("MM/dd/yyyy");
		for(Iterator it=tasksNotEnded.iterator(); it.hasNext();) 
            it.next().setEndingDate(dateNow);
	}

}
