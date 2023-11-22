let snippetCounter = 0;

function addSnippet() {
    
    let snippetID = "snippet" + snippetCounter;
    let div = document.createElement('div');
    div.setAttribute('class', 'snippet-container');
    div.setAttribute('id', snippetID);
    div.innerHTML = `
                <label for="filename">Filename:</label>
                <input type="text" name="${snippetID}_filename" value=""/>  
                
                <label for="snippet">Snippet*:</label>
                <textarea class='snippet-codeblock-midi' name="${snippetID}_codesnippet" required="true"></textarea>    
                
                <label for="language_id">Language*:</label>
                <select id="language_id" name="${snippetID}_language_id" required="true">
                        ${languageOptionsHTMLString}              
                    ?> 
                </select>      
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
