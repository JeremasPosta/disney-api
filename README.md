# Alkemy Disney Api Challenge

This project is a Challenge for Alkemy.org.

The objective is to develop a Rest API with many characteristics based on manage Disney characters and their films and series.

You can read the documentation in:
https://documenter.getpostman.com/view/15625913/UV5dctru


The API endpoints now are working on:
https://alkemy-disney-api.herokuapp.com/

You can access a previewer of the Api content at this repo:
https://github.com/JeremasPosta/disney-api-front

It's working here:
https://foob.ar/alkemy/

You need to have an Auth token to access it. I'm sure if you read the documentation, you will be able to generate a link like this to access it:

https://foob.ar/alkemy/?token=eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE2MzU2ODIwODh9.ncHRiGRVy2xng

If you have troubles with this, you can email me at ramirez.jeremias.94(at)gmail(dot)com.

--------------------------------------------
## About the project

The tests can be done with:
```
rspec .\spec\
```
Current test coverage is about 85%.

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
You can use the cloudinary given URL to post your new Characters, Movies, and Genres, see Documentation for more info.

--------------------------------------------
