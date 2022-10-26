Feature: Simple GET Requests

Scenario: Crie um teste de API que retorne todos os comentarios. Valide que TODO o retorno está de acordo com o esperado.
* url 'https://jsonplaceholder.typicode.com/'
Given path 'comments'
And param id = 4
When method get
Then status 200
* def json = read('resources/comments.json')
And match response == json
