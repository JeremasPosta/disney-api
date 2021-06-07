# Alkemy Disney Api Challenge

This project is a Challenge for Alkemy.org.

The objective is to develop a Rest API with many characteristics based on manage Disney characters and their films and series.

The current endpoints working are:


https://alkemy-disney-api.herokuapp.com/sign-up for POST name, email and password for new users

https://alkemy-disney-api.herokuapp.com/login for POST email and password, it response a Token to authenticate other endpoints. The Authentication token must be set as Bearer token.

https://alkemy-disney-api.herokuapp.com/photos for GET list and POST new photos for the other models. Response the photo URL in CLoudinary.

https://alkemy-disney-api.herokuapp.com/characters for GET list and POST new characters.

https://alkemy-disney-api.herokuapp.com/characters?param=value now can ask for specific values of characters.

https://alkemy-disney-api.herokuapp.com/movies   for GET list and POST new movies.

https://alkemy-disney-api.herokuapp.com/genres   for GET list and POST new genres.

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
