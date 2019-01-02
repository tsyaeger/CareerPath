
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
    return `<h3><a href='/users/${this.user_id}/jobs/${this.id}'>${this.company} - ${this.position}</a></h3>`
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
        <a href="/users/${this.user_id}/jobs/${this.id}">${this.company} - ${this.position}</a>
        </h3><span id='${this.id}' class='job remove-job ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span>`
    return spanItem
}


// $( document ).on('turbolinks:load', function() {
//     user_id = $(".user-id").data("id")
//     job_id = $(".job-id").data("id")

//     $.get(`/users/${user_id}/jobs/${job_id}`, function(data) {

//         job = new Job(data, user_id)

//         displayAppliedDetails(job)  
//         toggleApplied(job) 

//         getDocuments(data) 
//         getContacts(data)

//         nextButton()
//         previousButton()

//         linkContact()
//         linkDocument()
        
//         unlinkContact()
//         unlinkDocument()

//         docClick()
//         contactClick()
//     },'json'
//     );
// })


// //RETRIEVE JOB DOCUMENTS, CREATE CONSTANT INSTANCE, APPEND DOCUMENTS
// const getDocuments = function (data) {
//     jQuery(data['documents']).each(function(i, document){
//         let d = new Document(document, user_id)
//         $("#job-documents").append(d.formatSpan())
//     })
// }


// //RETRIEVE JOB CONTACTS, CREATE CONSTANT INSTANCE, APPEND CONTACTS
// const getContacts = function (data) {
//     jQuery(data['contacts']).each(function(i, contact){
//         let c = new Contact(contact, user_id)
//         $("#job-contacts").append(c.formatSpan())
//     })
// }

// //DISPLAY APPLIED STRING AND TOGGLE STATUS
// const displayAppliedDetails = function (job) {
//     // renders yes/no string to applied status
//     $('#job-applied').html(job.appliedString())
//     // identifies toggle element and positions according to status
//     let tog = document.getElementById("switch")
//     tog.checked = job.applied;
// }

// //CHANGE APPLIED STATUS USING TOGGLE
// const toggleApplied = function (job) {
//     // place click listener on toggle
//     $('#switch').on('click', function() {
//         // route changing to new status
//         job.applied = !job.applied;
//         $.get(`/users/${user_id}/jobs/${job_id}/applied?q=${job.applied}`, function(data) {
//             $('#job-applied').html(job.appliedString(job.applied))
//         })
//     })
// }



// //BUTTON LISTENER, SEND PATCH W CONTACT TO CONTROLLER, 
// const linkContact = function() {
//     $('#btn-add-contact').on('click', function(e) {
//         e.preventDefault()
//         var form = $('#add-contact')
//         var action = form.attr('action')
//         var c_id = form.serialize()

//         $.ajax({url: `/users/${user_id}/jobs/${job_id}/add_contact`, 
//             data: c_id, 
//             type: "PATCH", 
//             success: function (data) {
//                 contact = new Contact(data, user_id)
//                 $("#job-contacts").append(contact.formatSpan())
//                 alert('success') 
//             },
//             error: function (data) {
//                 alert('no success') }
//         })
//     })
// }

// //BUTTON LISTENER, SEND PATCH W DOCUMENT TO CONTROLLER, 
// const linkDocument = function() {

//     $('#btn-add-document').on('click', function(e) {
//         e.preventDefault()
//         var form = $('#add-document')
//         var action = form.attr('action')
//         var d_id = form.serialize()

//         $.ajax({url: `/users/${user_id}/jobs/${job_id}/add_document`,
//         data: d_id,
//         type: "PATCH", 
//         success: function (data) {
//             doc = new Document(data, user_id)
//             $("#job-documents").append(doc.formatSpan())
//             alert('success') },
//         error: function (data) {
//             alert('no success') }
//         })
//     })
// }

// // REMOVE JOB CONTACT 
// const unlinkContact = function() {

//     $(document.body).on('click', 'span.remove-contact', function(e) {
//         let contact_id = this.id

//         $.ajax({
//             type: "DELETE", 
//             url: `/users/${user_id}/jobs/${job_id}/contact/${contact_id}/unlink`,
//             data: contact_id,
//             dataType: 'json',
//             contentType : 'application/json',
//             processData: false,
//             success: function (data) {
//                 console.log(data)
//                 let id = data['id']
//                 $("#contactItem-" + id).remove()
//                 $("#" + id).remove();
//                 $('.remove-contact.'+id).remove()
//             },
//             error: function (data) {
//                 alert('no success') }
//         })
//     })
// }

// // BUTTON LISTENER, REMOVE JOB DOCUMENT 
// const unlinkDocument = function() {

//     $(document.body).on('click', 'span.remove-document', function(e) {
//         let document_id = this.id

//         $.ajax({
//             type: "DELETE", 
//             url: `/users/${user_id}/jobs/${job_id}/document/${document_id}/unlink`,
//             data: document_id,
//             dataType: 'json',
//             contentType : 'application/json',
//             processData: false,
//             success: function (data) {
//                 console.log(data)
//                 let id = data['id']
//                 $("#documentItem-" + id).remove()
//                 $("#" + id).remove();
//             },
//             error: function (data) {
//                 alert('no success') }
//         })
//     })
// //LISTENER FOR NEXT BUTTON - SENDS TO USER'S NEXT JOB
// const nextButton = function() {
//     $('.btn-next').on('click', function() {
//         let nextPg = `${job_id}/next`
//         window.location.href = nextPg;
//     })
// }

// //LISTENER FOR PREVIOUS BUTTON - SENDS TO USER'S PREVIOUS JOB
// const previousButton = function() {
//     $('.btn-previous').on('click', function() {     
//         let previousPg = `${job_id}/previous`
//         window.location.href = previousPg;
//     })
// }
// }

// // OPEN DOC DROPDOWN SPAN
// const docClick = function() {
//     var clicks = 0

//     $(document.body).on('click', "i.doc", function() {
//         var id = this.id

//     if (clicks % 2 == 0) {
//         $('.document.'+id).css('display', 'block')
//         clicks++
//         }
//     else {
//         $('.document.'+id).css('display', 'none')
//         clicks++
//         } 
//     });
// }

// // OPEN CONTACT DROPDOWN SPAN
// const contactClick = function() {
//     var clicks = 0

//     $(document.body).on('click', "i.contact", function() {
//         var id = this.id

//     if (clicks % 2 == 0) {
//         $('.contact.'+id).css('display', 'block')
//         clicks++
//         }
//     else {
//         $('.contact.'+id).css('display', 'none')
//         clicks++
//         } 
//     });
// }

