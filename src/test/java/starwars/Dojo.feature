Feature: Pessoas do StarWars

#   API para desenvolvimento: https://jsonplaceholder.typicode.com/
#   Sugestão de tag para utilizar no runner: @dojo
#   Site da API: https://github.com/intuit/karate

# Challenges:
#   1. Crie um teste de API que retorne todos os comentários. Valide que TODO o retorno está de acordo com o esperado.
# 	2. Crie um teste de API que insira um novo usuário. Valide que TODO o retorno está de acordo com o esperado.
# 	3. Crie um teste de API que atualiza um usuário. Valide que TODO o retorno está de acordo com o esperado.


Background:

* url "https://jsonplaceholder.typicode.com/"

@dojo
Scenario: Crie um teste de API que retorne todos os comentarios. Valide que TODO o retorno está de acordo com o esperado.
Given path 'comments'
And param id = 4
When method get
Then status 200
* def json = read('comments.json')
And match response == json


@dojo
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
Given path 'users'
And request payload
When method post
Then status 201
* def json = read('postUsers.json')
And match response == json


@dojo
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
Given path 'users/5'
And request payload
When method put
Then status 200
* def json = read('putUsers.json')
And match response == json