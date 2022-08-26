window.addEventListener('DOMContentLoaded', (event) =>{
    getVisitCount();
})
// Added the link below from the output of the function
const functionApi = 'http://localhost:7071/api/GetResumeCounter';

// function for counter
const getVisitCount = () => {
    let count = 100;
    fetch(functionApi).then(Response => {
        return Response.json()
    }).then(Response => {
        console.log("Website called function API.")
        count = Response.count;
        document.getElementById("counter").innerText = count;
    }).catch(function(error){
        console.log(error);
    });
    return count
}