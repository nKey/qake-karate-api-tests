Feature: Simple PUT Requests

Scenario: Crie um teste de API que atualiza um usuário. Valide que TODO o retorno está de acordo com o esperado.
* def payload =
"""
{
  "name": "Douglas Adriano Queiroz Alterado",
  "username": "dougaq",
  "email": "dougaq@gmail.com",
  "address": {
    "street": "Rod. João Paulo 692",
    "suite": "D",
    "city": "Florianópolis",
    "zipcode": "88030-300",
    "geo": {
      "lat": "-27.593522",
      "lng": "-48.558522"
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
Given path 'users/5'
And request payload
When method put
Then status 200
* def json = read('resources/putUsers.json')
And match response == json