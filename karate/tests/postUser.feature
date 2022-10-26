Feature: Simple POST Requests

Scenario: Crie um teste de API que insira um novo usuário. Valide que TODO o retorno está de acordo com o esperado.
* def payload =
"""
{
  "name": "Douglas Adriano Queiroz",
  "username": "dougaq",
  "email": "dougaq@gmail.com",
  "address": {
    "street": "Rod. João Paulo 692",
    "suite": "D",
    "city": "Florianópolis",
    "zipcode": "88030-300",
    "geo": {
      "lat": "-27.593500",
      "lng": "-48.558540"
    }
  },
  "phone": "(48) 999886724",
  "website": "https://www.linkedin.com/in/douglas-queiroz-680b1978/",
  "company": {
    "name": "NKEY",
    "catchPhrase": "Coocriando Soluções Digitais",
    "bs": "NKEY"
  }
}
"""
* url 'https://jsonplaceholder.typicode.com/'
Given path 'users'
And request payload
When method post
Then status 201
* def json = read('resources/postUsers.json')
And match response == json
