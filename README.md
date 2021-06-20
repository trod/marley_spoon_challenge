# MarleySpoon Code challenge

## Description

Simple backend for providing access to recipes and associated chefs. Data is cached in in-memory storage (ets)<br>
in order to limit number of requests to contentful. Every 10 seconds all data is being fetched and upserted.

## Out of scope:
* Frontend part.
* Release, dockerisation & deployment
* Authentication for gql endpoint
* Telemetry, proper logging etc.
* Some nice things like credo, dialyzer.
* Only basic entities like `chef` and `recipe` are implemented. I decied to skip others due to time limit constraint, but it should not be a problem to add the rest if needed.


## Installation
  * Install dependencies with `mix deps.get`
  * Decrypt secrets with `mix secret <secret code>`
  * Start server with `MIX_ENV=prod mix phx.server`

## Tests
 Run tests with `mix test`

## GQL query example:
### Request:
```
curl
 --request POST
 --url http://localhost:4000/api/graph
 --header 'Content-Type: application/json'
--data '{"query":"query {\n  recipe(id: \"437eO3ORCME46i02SeCW46\") {\n    title\n    id\n    chef {\n      name\n    }\n  }\n}"}'
```

### Response:
```
{"data":{"recipe":{"chef":{"name":"Jony Chives"},"id":"437eO3ORCME46i02SeCW46","title":"Crispy Chicken and Rice\twith Peas & Arugula Salad"}
```