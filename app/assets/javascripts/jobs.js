
function Job(job, user_id) {
    this.user_id = user_id
    this.id = job.id
    this.company = job.company
    this.position = job.position
    this.url = job.url
    this.date_posted = job.date_posted 
    this.applied = job.applied
    this.job_desc = job.job_desc
    this.co_desc = job.co_desc
}

// Listed job items (used on user show page)
Job.prototype.formatJobIndex = function() {
    return `<h3><a href='/jobs/${this.id}'>${this.company} - ${this.position}</a></h3>`
}

// Returns applied status string (used in job show page)
Job.prototype.appliedString = function(applied_bool= this.applied) {
    let text = applied_bool ? 'Yes' : 'No'
    return `<h3 id='applied-bool'>Applied: ${text}</h3>`
}

// Returns job with remove span (used in show pages of linked items)
Job.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large job" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/jobs/${this.id}">${this.company} - ${this.position}</a>
        </h3><span id='${this.id}' class='job remove-job ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span>`
    return spanItem
}

