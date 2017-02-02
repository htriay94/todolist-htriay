package fr.icdc.dei.todolist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fr.icdc.dei.todolist.service.TaskService;

@Controller
@RequestMapping("/tasks")
public class TaskController {
	
	@Autowired
	private TaskService taskService;

	@Autowired
	private List<Task> tasksNotEnded;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listTasks() {
		ModelAndView page = new ModelAndView("Tasks");
		page.addObject("tasks", taskService.list());
		return page;
	}

	@RequestMapping(method=RequestMethod.GET, "/TasksNotEndedBetween", params = {"starting", "ending"})
	public ModelAndView listTasksNotEndedBetween(@RequestParam("starting") String starting) {
		ModelAndView page = new ModelAndView("TasksNotEndedBetween");
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date startingD = format.parse(starting);
		Date endingD = format.parse(ending);
		this.tasksNotEnded = taskService.listsTasksNoEndedBetween(startingD,endingD);
		page.addObject("tasks", this.tasksNotEnded);
		return page;
	}

	@RequestMapping("/EndTasks")
	public ModelAndView endTasks() {
		ModelAndView page = new ModelAndView("Tasks");
		taskService.endTasksNotEnded(this.tasksNotEnded);
		this.tasksNotEnded = null;
		page.addObject("message", "Tâches terminées");
		return page;
	}

}
