# Pokémon App

A simple app to fetch pokémon related data from an endpoint, simulating an API
call.

## To run the app

To run the app on your machine, download the files, run the `flutter pub get`
command inside the project root folder and run `flutter run`, assuming that you
have a proper device (emulator or real) to run the app.

## Architecture

As there is only one feature in our app (Pokémon), there are only one folder
inside `lib` besides our app folder, in which the `Material App` is created.

Inside the `pokemon` folder, we have the following folders:

- `common`: Here we have helper files there are used by multiple parts of our
Pokémon feature. At the moment, only the constants folder is there.
- `controller`: This folder contains the `Provider` that will act like a bridge
between our UI and the data fetching from the web. Inside, we have the Provider
and an interface that we will use to fetch the data. This way, we can easily
change from where we get the data and the package used to access it.
- `entities`: This is where the core of our application lives. The Pokémon
feature only has one entity (`Pokemon`), which holds the attributes and methods
we need to have.
- `pages`: Here, we have the pages related to the Pokémon feature. There is the
`HomePage` which lists all pokémons retrieved from the web and the `DetailsPage`
which shows all the data related to a Pokémon.
- `services`: This is where all code related to data fetching lives. We have
the `api` folder, which encapsulates the Dio package we are using to fetch the
data and the `pokemon_service`, which implements our interface to get raw JSON
content and converts it to a `List<Pokemon>`.

## Tests

This area still needs improvement. The `pokemon` class is fully tested but there
is still room to improves the services tests, also test the controller class
and create widget and integration tests.

### To run the tests

Before running the tests, run `dart run build_runner build` so the Mockito
package can generate the mock files required to test the files inside the
`service` folder.

## Final thoughts

The goal of this app is just showcase a way to fetch data from an API. It is
simple and was conceived with this in mind.

I am open for any constructive feedback on how to improve this app, related to
code, architecture and tests.
