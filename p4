	 	Practical 4 
Aim: Write a program to create and implement modules and controllers in Angular JS 
Code: 
<! DOCTYPE html> 
<html> 	 
<head> 	 
<title>AngularJS 1.x Modules and Controllers</title> 
<style> body { 
font-family: Arial, sans-serif; margin: 0; padding: 20px; color: #333; 
} 
.container { max-width: 900px; margin: 0 auto; 
} 
.section { border: 1px solid #ddd; border-radius: 4px; padding: 15px; margin-bottom: 20px; background-color: #f9f9f9; 
} h1, h2, h3 { 
color: #2c3e50; 
} 
input, select, button { 
margin: 5px 0; padding: 8px; border-radius: 4px; border: 1px solid #ccc; 
} button { 
background-color: #3498db; color: white; border: none; cursor: pointer; 
} button:hover  	{ 
background-color: #2980b9; 
} table { 
width: 100%; border-collapse: collapse; margin-top: 10px; } table, th, td { 
border: 1px solid #ddd; } th, td { 
padding: 10px; text-align: left; } th { background-color: #f2f2f2; 
} 
.active { background-color: #e0f7fa; 
} 
.text-danger { color: #e74c3c; 
} 
.nav-tabs { list-style-type: none; margin: 0; padding: 0; overflow: hidden; border-bottom: 1px solid #ccc; 
} 
.nav-tabs li { float: left; 
} 
.nav-tabs li a { display: block; padding: 10px 15px; text-decoration: none; color: #3498db; cursor: pointer; 
} 
.nav-tabs li a:hover { background -color: #eee; 
} 
.nav -tabs li a.active { background-color: #f9f9f9; border: 1px solid #ccc; border-bottom-color: transparent; color: #333; } 
.tab-content { padding: 15px; border: 1px solid #ccc; border-top: none; 
} 
</style> 
</head> 
<body ng-app="mainApp"> 
<div class="container"> 
<h1>AngularJS 1.x Modules and Controllers Demo</h1> 
<!-- Tabbed interface to demonstrate communications between controllers --> 
<div ng-controller="TabController"> 
<ul  class="nav-tabs"> 
< li ng-repeat="tab in tabs"> 
<a  ng-class="{ active: isActiveTab(tab.id) }" ng-click="setActiveTab(tab.id)">{{ tab.title }}</a> < /li> 
</ul> 
<div class="tab-content"> 
<!-- First tab: UserController demonstration --> 
<div ng-show="activeTab === 1"> 
<div class="section" ng-controller="UserController"> 
<h2>User Management Module</h2> 
<p>This section demonstrates a simple user management controller.</p> 
<form ng-submit="addUser()"> 
<div> 
< label>Name:</label> 
< input type="text" ng-model="newUser.name" required> 
</div> 
<div> 
 <label>Email:</label> 
<input type="email" ng-model="newUser.email" required> 
	</div> 	 
<div>  
< label>Role:</label> 
< select ng-model="newUser.role" required> 
<option value="">Select a role</option> 
<option value="Admin">Admin</option> <option value="User">User</option> 
<option value="Guest">Guest</option> 
</select> 
</div> 
<button type="submit">Add User</button> 
</form> 
<h3>User List</h3> 
<input type="text" ng-model="userSearch" placeholder="Filter 
users..."> 
<table> 
<thead> 
<tr> 
<th> Name</th> 
<th> Email</th> 
<th> Role</th> 
<th> Actions</th> 
</tr> 
	</thead> 	 
	<tbody> 	 
<tr ng-repeat="user in users | filter:userSearch" ng-class="{ 
active: selectedUser === user }"> 
<td> {{ user.name }}</td> 
<td> {{ user.email }}</td> 
<td> {{ user.role }}</td> 
<td>  
< button ng-click="selectUser(user)">Select</button> 
< button ng-click="removeUser($index)">Remove</button> </td> 
< /tr> 
	</tbody> 	 
< /table> 
<div ng-show="selectedUser"> 
< h3> Selected User</h3> 
<p> Name: {{ selectedUser.name }}</p> 
<p> Email: {{ selectedUser.email }}</p> 
<p> Role: {{ selectedUser.role }}</p> 
</div> 
</div> 
</div> 
<!-- Second tab: ProductController demonstration --> 
<div ng-show="activeTab === 2"> 
<div class="section" ng-controller="ProductController"> 
<h2>Product Management Module</h2> 
<p>This section demonstrates a product management controller with 
service dependency.</p> 
<form ng-submit="addProduct()"> 
<div> 
< label>Product Name:</label> 
< input type="text" ng-model="newProduct.name" required> 
	</div> 	 
<div>  
< label>Price ($):</label> 
< input type="number" ng-model="newProduct.price" min="0" 
required> 
	</div> 	 
<div>  
< label>Category:</label> 
< select ng-model="newProduct.category" required> 
	<option  	value="">Select a category</option> 
	<option  	value="Electronics">Electronics</option> 
	<option  	value="Clothing">Clothing</option> 
	<option  	value="Food">Food</option> 
	<option  	value="Books">Books</option> 
</select> 
	</div> 	 
<div>  
< label>In Stock:</label> 
< input type="checkbox" ng-model="newProduct.inStock"> 
</div> 
<button type="submit">Add Product</button> 
</form> 
<h3> Product Inventory</h3> 
<input type="text" ng-model="productSearch" placeholder="Filter 
products..."> 
<label> 
<input type="checkbox" ng-model="showOnlyInStock"> Show only in-stock items 
</label> 
<table> 
<thead> 
<tr> 
<th> Name</th> 
<th> Price</th> 
<th> Category</th> 
<th> Status</th> 
<th> Actions</th> 
</tr> 
	</thead> 	 
	<tbody> 	 
<tr ng-repeat="product in filterProducts() | 
filter:productSearch" ng-class="{ active: selectedProduct === product }"> 
<td> {{ product.name }}</td> 
<td> ${{ product.price.toFixed(2) }}</td> 
<td> {{ product.category }}</td> 
<td  ng-class="{'text-danger': !product.inStock}"> 
{{ product.inStock ? 'In Stock' : 'Out of Stock' }} 
</td>  
<td>  
<button ng-click="toggleStock(product)"> 
{{ product.inStock ? 'Mark Out of Stock' : 'Mark In Stock' 
}} 
</button> 
<button ng-click="removeProduct($index)">Remove</button> </td> 
</tr> 
</tbody> 
</table> 
< h3>Product Statistics</h3> 
< p>Total Products: {{ products.length }}</p> 
<p> In-Stock Products: {{ getStockCount() }}</p> 
<p>Average Price: ${{ getAveragePrice() }}</p> </div > 
</div> 
<!-- Third tab: Communication between controllers demo --> 
<div ng-show="activeTab === 3"> 
<div class="section"> 
<h2>Communication Between Controllers</h2> 
<p>This section demonstrates communication between controllers using 
services.</p> 
<div ng-controller="NotificationController"> 
<h3>Notification Center</h3> 
<button ng-click="sendMessage('This is a test message from the 
Notification controller!')"> 
Send Test Message 
</button> 
<button ng-click="clearMessages()">Clear All Messages</button> 
<h4>Current Messages:</h4> 
<div ng-show="messages.length === 0"> 
<p><em>No messages available</em></p> 
	</div> 	 
<ul>  
< li ng-repeat="msg in messages track by $index"> 
{{  msg }} <button 
ng-click="removeMessage($index)">Dismiss</button> 
< /li> 
</ul>  
</div> 
<div ng-controller="ReceiverController"> 
<h3> Message Receiver</h3> 
	<button  	ng-click="checkMessages()">Check for Messages</button> 
	<button  	ng-click="sendReply()">Send Reply</button> 
<div ng-show="lastMessage"> 
< h4>Last Message Received:</h4> 
< p>{{ lastMessage }}</p> 
</div> 
</div> 
</div> 
< /div> 
	</div> 	  
< /div> 
</div> 
<!-- Load AngularJS --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.2/angular.min.js"></ script> 
<!-- Application Script --> 
<script> 
// Create main application module var mainApp = angular.module('mainApp', []); 
// Create a service for sharing data between controllers mainApp.service('SharedDataService', function() { 
var sharedData = { 
messages: [] 
}; 
return { 
getMessages: function() { 
return sharedData.messages; 
}, addMessage: function(message) { 
sharedData.messages.push(message); 
}, 
clearMessages: function() { sharedData.messages = []; 
}, removeMessage: function(index) { 
sharedData.messages.splice(index, 1); 
} 
}; 
}); 
// Create a utility service 
mainApp.service('UtilityService', function() { 
return { 
generateId: function() { 
return Math.floor(Math.random() * 10000); 
}, formatDate 	: function(date) { 
return date.toLocaleDateString(); 
}, calculateAverage: function(items, property) { 
if (items.length === 0) return 0; var sum = items.reduce(function(total, item) { 
return total + (item[property] || 0); 
}, 0); return sum / items.length; 
} 
}; 
}); 
// Tab Controller mainApp.controller('TabController', function($scope) { 
$scope.tabs = [ 
{ id: 1, title: 'User Management' }, 
{ id: 2, title: 'Product Management' }, 
{ id: 3, title: 'Controller Communication' } 
];  
	$scope 	.activeTab = 1; 
	$scope 	.setActiveTab = function(tabId) { 
$ scope.activeTab = tabId; 
};  
$scope 	.isActiveTab = function(tabId) { return $scope.activeTab === tabId; 
}; 
}); 
// User Controller mainApp.controller('UserController', function($scope) { 
// Initialize controller data 
$scope.users = [ 
{ name: 'John Doe', email: 'john@example.com', role: 'Admin' }, 
{ name: 'Jane Smith', email: 'jane@example.com', role: 'User' }, 
{ name: 'Mike Johnson', email: 'mike@example.com', role: 'Guest' } 
]; 
$scope.newUser = { name: '' , email: '', role: '' 
}; 
$scope.selectedUser = null; 
// Controller methods 
$scope.addUser = function() { 
$ scope.users.push(angular.copy($scope.newUser)); 
$ scope.newUser = { name: '', email: '', role: '' }; 
}; 
$scope.removeUser = function(index) { if ($scope.selectedUser === $scope.users[index]) { $scope.selectedUser = null; 
} 
$scope.users.splice(index, 1); 
}; 
$scope.selectUser = function(user) { 
$scope.selectedUser = user; 
}; 
}); 
// Product Controller mainApp.controller('ProductController', function($scope, UtilityService) { 
// Initialize controller data with dependency on UtilityService 
$scope.products = [ 
{ name: 'Laptop', price: 999.99, category: 'Electronics', inStock: true 
}, 
{ name: 'T-Shirt', price: 24.99, category: 'Clothing', inStock: true }, 
{ name: 'Book', price: 14.99, category: 'Books', inStock: false } 
]; 
$scope.newProduct = { name: '', price: 0, category: '', inStock: true 
};  
	$scope.showOnlyInStock 	 = false; 
// Controller methods 
$scope.addProduct = function() { 
$ scope.products.push(angular.copy($scope.newProduct)); 
$ scope.newProduct = { name: '', price: 0, category: '', inStock: true }; 
};  
	$scope 	.removeProduct = function(index) { 
$scope.products.splice(index, 1); 
};  
$scope .toggleStock = function(product) { product.inStock = !product.inStock; 
};  
$scope 	.filterProducts = function() { if ($scope.showOnlyInStock) { return $scope.products.filter(function(product) { 
return product.inStock; 
}); } return $scope.products; 
}; 
$scope 	.getStockCount = function() { return $scope.products.filter(function(product) { 
return product.inStock; 
}).length; 
}; 
$scope.getAveragePrice = function() { var avg = UtilityService.calculateAverage($scope.products, 'price'); return avg.toFixed(2); 
}; 
}); 
// Notification Controller (demonstrates service usage) mainApp.controller('NotificationController', function($scope, SharedDataService) { 
$scope.messages = SharedDataService.getMessages(); 
	$scope 	.sendMessage 	 = function(message) { 
SharedDataService.addMessage(message); 
};  
	$scope 	.clearMessages = function() { 
SharedDataService.clearMessages(); 
};  
	$scope 	.removeMessage = function(index) { 
SharedDataService.removeMessage(index); }; 
}); 
// Receiver Controller (demonstrates controller communication) mainApp.controller('ReceiverController', function($scope, SharedDataService, UtilityService) { 
$scope.lastMessage = ''; 
$scope.checkMessages = function() { var messages = SharedDataService.getMessages(); $ scope.lastMessage = messages.length > 0 ? 
messages[messages.length - 1] : 
	'No messages available' 	; 
}; 
$scope.sendReply = function() { var date = new Date(); 
var formattedDate = UtilityService.formatDate(date); 
SharedDataService.addMessage('Reply from Receiver on ' + formattedDate); 
}; 
}); 
</script> 	 
</body> 	 
</html> 	 Output: 
