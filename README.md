<p align="center">
  <img src="assets/images/app-icon.png" alt="App Icon" />
</p>

# Cookify
Cookify is a mobile application that enable users to explore healthful meals and how they are cooked 

**Table of Contents**
- Features and usage
- Technologies used
- File Hierarchy
- How it looks
- How to install
- Code Extraction
________________________________________________________________

### Features and usage

Cookify app provides a comprehensive user experience with the following features:

- **Meal Favoritization**: add or remove meals from favorites list

- **Meal Purchasing**: add or remove meals from basket.

- **Meal Cooking steps**: written cooking instruction with a supportive video of how should the meal be cooked.

- **Advanced Meal Search**: meals are searchable through their names or ingredients.

- **Meal Categorization**: a lot of meal categories containing meals suitable for vegetarian and carnivore people, moreover the kitchens around the world introduces the most famous meals within.

### Technologies used

- Dart
- Flutter
- Restful API
- LocalStorage
- - Shared Preferences
- Bloc(Cubit)
- Firebase(Auth, firestore)
- Clean Architecture

### File Hierarchy
```
.
└── lib
    ├── core
    │   ├── config
    │   ├── constants
    │   ├── enums
    │   ├── extensions
    │   ├── failure
    │   ├── router
    │   ├── theme
    │   └── utils
    ├── features
    │   ├── auth
    │   │   ├── login
    │   │   │   ├── data
    │   │   │   │   ├── data_source
    │   │   │   │   └── repositories
    │   │   │   ├── domain
    │   │   │   │   ├── repositories
    │   │   │   │   └── usecases
    │   │   │   └── presentation
    │   │   │       ├── managers
    │   │   │       ├── pages
    │   │   │       └── widgets
    │   │   │           └── login_part
    │   │   └── signup
    │   │       ├── data
    │   │       │   ├── data_source
    │   │       │   └── repositories
    │   │       ├── domain
    │   │       │   ├── repositories
    │   │       │   └── usecases
    │   │       └── presentation
    │   │           ├── managers
    │   │           ├── pages
    │   │           └── widgets
    │   │               └── signup_part
    │   ├── basket
    │   │   ├── data
    │   │   │   ├── data_source
    │   │   │   ├── models
    │   │   │   └── repositories
    │   │   ├── domain
    │   │   │   ├── entities
    │   │   │   ├── repositories
    │   │   │   └── usecases
    │   │   ├── presentation
    │   │   │   ├── managers
    │   │   │   ├── pages
    │   │   │   └── widgets
    │   │   └── utils
    │   ├── favorites
    │   │   ├── data
    │   │   │   ├── data_source
    │   │   │   ├── models
    │   │   │   └── repositories
    │   │   ├── domain
    │   │   │   ├── entities
    │   │   │   ├── repositories
    │   │   │   └── usecases
    │   │   ├── presentation
    │   │   │   ├── managers
    │   │   │   ├── pages
    │   │   │   └── widgets
    │   │   └── utils
    │   ├── home
    │   │   ├── home_presentation
    │   │   │   ├── managers
    │   │   │   ├── pages
    │   │   │   └── widgets
    │   │   ├── kitchens
    │   │   │   ├── data
    │   │   │   │   ├── data_source
    │   │   │   │   ├── models
    │   │   │   │   └── repositories
    │   │   │   ├── domain
    │   │   │   │   ├── enitities
    │   │   │   │   ├── repositories
    │   │   │   │   └── usecases
    │   │   │   └── presentation
    │   │   │       ├── kitchen_view
    │   │   │       ├── manager
    │   │   │       └── widgets
    │   │   └── meal_categories
    │   │       ├── data
    │   │       │   ├── data_source
    │   │       │   ├── models
    │   │       │   └── repositories
    │   │       ├── domain
    │   │       │   ├── enitities
    │   │       │   ├── repositories
    │   │       │   └── usecases
    │   │       └── presentation
    │   │           ├── kitchen_view
    │   │           ├── manager
    │   │           ├── widgets
    │   │           └── meal_category_list_widget
    │   └── meal_search
    │       ├── data
    │       │   ├── data_source
    │       │   ├── models
    │       │   └── repositories
    │       └── domain
    │           ├── enitities
    │           ├── repositories
    │           └── usecases
    ├── meal_details
    │   ├── managers
    │   ├── pages
    │   └── widgets
    ├── onBoarding
    │   └── widgets
    ├── splash
    │   └── widgets
    ├── reusable_widgets
    └── main
```

### How it looks

![1.png](screenshots%2F1.png)
![2.png](screenshots%2F2.png)
![3.png](screenshots%2F3.png)
![4.png](screenshots%2F4.png)

you could see screenshots singularly, just go to [screenshots](screenshots) dir.

>For more, watch the following video that demonstrate a walkthrough features of *Cookify*:
>
>[Video Preview](https://www.youtube.com/watch?v=_N11jLvNJU8)

### How to install

Firstly, You should know this app interacts with an API in which you should have your own `API KEY`, to get one just register on [TheMealDB](https://www.themealdb.com/api.php). once you got a key you can follow the following steps:
Note: you can use `apiKey = 1` for testing purposes
1. ```
   git clone https://github.com/AliEsmaeil/cookify.git 
   ```
2. in your project level `wagba` or `cookify`, create a `.env` file and store your `API Key` there.
   this is related to sensitive environment variables hiding (You key shouldn't be exposed in public repos)
   for more info about this, you could see my repo [api-key-hiding-client](https://github.com/AliEsmaeil/api-key-hiding-client), this repo involves a detailed explanation of how to hide your api key.

3. ```
   flutter clean
   ``` 
4. ```
   flutter pub get   
   ```
5. ```
   dart run build_runner watch --delete-conflicting-outputs
   ```
   The fifth step to just make sure the generated files are already up and regenerate `_Config.g.dart` file which obfuscates the key you have put in `.env` file.
6. Remember! this app uses Firebase Email authentication and firestore DB to store favorite meals and meals dropped in the basket, you should create your own firebase app and enable Firebase db and email authentication for this application, and cookify will handle the rest. 

7. And you are done, go ahead and run.

### Code Extraction
While this repository is licensed under the Apache License 2.0, we would like to highlight the following important points:

- Code Extraction: Please refrain from extracting code from this repository for use in other projects. The code is provided for the purposes of learning, experimentation, and contribution to this project only.

- Respect the License: Ensure that any use of the code complies with the terms of the Apache License 2.0. The license permits use, modification, and distribution, but does not allow for code extraction for patent-related claims.

Last but not least, this repo is welcoming contribution so, feel free to open a pull request.
