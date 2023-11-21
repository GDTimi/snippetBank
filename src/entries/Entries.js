var snippetCounter = 0;

function addSnippet() {
    var snippetID = "snippet" + snippetCounter;
    var div = document.createElement('div');
    div.setAttribute('class', 'snippet-container');
    div.setAttribute('id', snippetID);
    div.innerHTML = `
            <form class="form" method="Post">
                <label for="filename">Filename*:</label>
                <input type="text" name="filename" value=""/>  
                
                <label for="snippet">Snippet*:</label>
                <textarea class='snippet-codeblock-midi' name="snippet"></textarea>     
            </form>       
    `;
    document.getElementById('snippet-hold').appendChild(div);

    // Create the snippet remover button
    var inputElement = document.createElement('input');
    inputElement.type = "button";
    inputElement.value = "- snippet";
    inputElement.addEventListener('click', function(){
        removeSnippet(snippetID);
    });
    document.getElementById('snippet-hold').appendChild(inputElement);

    snippetCounter++;
} 

function removeSnippet(snippetID) {
    var elem = document.getElementById(snippetID);
    elem.parentNode.removeChild(elem);
}       
