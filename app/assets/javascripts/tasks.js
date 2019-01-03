
function Task(task, user_id) {
	this.user_id = user_id
    this.id = task.id
    this.title = task.title
    this.desc = task.description
    this.due = task.due_date
    this.completed = task.completed
}



Task.prototype.formatIndex = function() {
    let taskHTML = `<h3><a href="/users/${this.user_id}/tasks/${this.id}">${this.title} - ${this.formatDate()}</a></h3>`
    return taskHTML
}


Task.prototype.formatDate = function() {
    let date = new Date(this.due)
    dateString = date.toLocaleDateString()
    return dateString
}    



Task.prototype.completedString = function(completed_bool= this.completed) {
    let compString = completed_bool.toString()
    return `<h3 id='completed-bool'>COMPLETED: ${compString.toUpperCase()}</h3>`
}


Task.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large task" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/users/${this.user_id}/tasks/${this.id}">${this.title} - ${this.formatDate()}</a>
        </h3><span id='${this.id}' class='task remove-task ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span>`
    return spanItem
}






