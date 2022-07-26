window.addEventListener('DOMContentLoaded', (event) =>{
    getVisitCount
})

const functionApi = '';

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