<! DOCTYPE html> 	     	 
	<html 	 lang="en" ng-app="studentApp"> 
	<head> 	 
<meta charset="UTF-8"> 
	<title>Student 	 Records Management</title> 
	<link 	 rel="stylesheet" href="css/styles.css"> 
<script 	 src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script> 
<style> body { 
font-family: Arial, sans-serif; margin: 20px; 
} 
input 
{ margin: 
5px; 	 padding: 5px; 
} 
button { 
padding: 5px 10px; margin: 5px; background-color: #3498db; color: white; border: none; cursor: pointer; 
} 
button:hover { 
background-color: #2c3e50; 
} 
table { 
width: 100%; 
 	margin-top: 20px; 
 
 	 	 
border-collapse: collapse; 
} th, td { 
border: 1px solid #ddd; padding: 10px; text-align: center; 
} 
</style> 
<script> angular.module('studentApp', []) 
	.controller('StudentController', 	 function() 
{ var vm = this; 
vm.students = [ 
{ name: 'Avinash', email: 'avinash@example.com', phone: '123-456-7890' }, 
{ name: 'John Doe', email: 'john@example.com', phone: '987-654-3210' } 
]; 
vm.addStudent = function() 
{ if (vm.newStudent) { vm.students.push(vm.newStudent); vm.newStudent = {}; // Reset input fields 
} 
}; 
vm.editStudent = function(index) { 
vm.newStudent = angular.copy(vm.students[index]); 
vm.students.splice(index, 1); // Remove current entry to avoid duplication 
}; 
vm.deleteStudent = function(index) 
 	{ vm.students.splice(index, 1); 
 
  	 
}; 
}) ; 
< /script> 
	</head> 	 
	<body 	 ng-controller="StudentController as ctrl"> 
<h1>Student Records Management</h1> 
<!-- Add Student Form --> 
<input type="text" ng-model="ctrl.newStudent.name" placeholder="Name"> 
<input type="email" ng-model="ctrl.newStudent.email" placeholder="Email"> 
<input type="text" ng-model="ctrl.newStudent.phone" placeholder="Phone"> 
<button ng-click="ctrl.addStudent()">Add Student</button> <!-- Students Table --> 
<table> 
<tr> 
< th>Name</th> 
< th>Email</th> 
< th>Phone</th> 
< th>Actions</th> 
</tr> 
<tr ng-repeat="student in ctrl.students"> 
<td>{{ student.name }}</td> 
<td>{{ student.email }}</td> 
<td>{{ student.phone }}</td> 
<td> 
<button ng-click="ctrl.editStudent($index)">Edit</button> 
<button ng-click="ctrl.deleteStudent($index)">Delete</button> </td> 
</tr> 
</table> 
	</body> 	 	  
	</html> 	 
