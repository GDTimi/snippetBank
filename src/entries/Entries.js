let snippetCounter = 0;

function addSnippet() {
    let snippetID = "snippet" + snippetCounter;
    let div = document.createElement('div');
    div.setAttribute('class', 'snippet-container');
    div.setAttribute('id', snippetID);
    div.innerHTML = `
            <form class="form" method="Post">
                <label for="filename">Filename:</label>
                <input type="text" name="filename" value=""/>  
                
                <label for="snippet">Snippet*:</label>
                <textarea class='snippet-codeblock-midi' name="snippet"></textarea>     
            </form>       
    `;
    document.getElementById('snippet-hold').appendChild(div);

    // Create the snippet remover button
    let inputElement = document.createElement('input');
    inputElement.type = "button";
    inputElement.value = "!-remove this snippet-!";
    inputElement.classList = "snippet-delete-button";
    inputElement.addEventListener('click', function(){
        removeSnippet(snippetID);
    });
    document.getElementById(snippetID).appendChild(inputElement);

    snippetCounter++;
} 

function removeSnippet(snippetID) {
    let elem = document.getElementById(snippetID);
    elem.parentNode.removeChild(elem);

}       