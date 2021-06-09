# Alkemy Disney Api Challenge

This project is a Challenge for Alkemy.org.

The objective is to develop a Rest API with many characteristics based on manage Disney characters and their films and series.

The current endpoints working are:

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/sign-up for POST name, email and password for new users

POST
```
{
    "name": "Aquiles Bailo",
    "email": "aquiles@bailo.com",
    "password": "123123"
}
```

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/login for POST email and password, it response a Token to authenticate other endpoints.
After get the response, the Authentication token must be set as Bearer token in future requests.

POST

```
{
    "email": "aquiles@bailo.com",
    "password": "123123"
}
```

Response:

```
{
    "auth_token": "eyJhbG92usjs.eyJ1c2VyX2lkd34leHAiOjE2MjMyOTExNDd9.fikiFwUfRRTTSSuzLYeX2iJNi8bq7GZz9rZqRC2c"
}
```

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/photos for GET list and POST new photos for the other models. Response the photo URL in CLoudinary.

POST

```
Form-data:
"image"
"caption"
```
Response:

```
{
    "photo": {
        "id": 3,
        "url": "https://alkemy-disney-api.herokuapp.com//rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0991f92d3da0cf9b0c656e93d1fb959472ba446c/Butter_Robot.png",
        "caption": "Butter Bot!"
    }
}
```

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/characters for GET list and POST new characters.

Character POST example

```
{
    "character": {
        "image": "imagencita.jpg",
        "name": "Luke Skywalker",
        "age": 28,
        "weight": 67,
        "filmography": "Star wars Saga",
        "history": "Poor boy"
    }
}
```

https://alkemy-disney-api.herokuapp.com/characters?param=value now can ask for specific values of characters.

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/movies   for GET list and POST new movies.

Movies POST example

```
{
    "screen_show": {
        "image": "imagencita.jpg",
        "title": "Iron Man",
        "realese": "01/10/2006",
        "qualification": 5,
        "cast_characters": "Tony Stark"
    }
}
```

--------------------------------------------

https://alkemy-disney-api.herokuapp.com/genres   for GET list and POST new genres.

POST

```
{
    "genre":{
        "image": "image.png",
        "name": "Action",
        "related_shows": "Rambo I, II, III, IV, V, VI"
    }
}
```
