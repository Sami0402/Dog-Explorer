# dog_explorer

## Overview

This Flutter application is designed to provide users with a comprehensive view of various dog breeds through integration with the DogAPI. The app features a user-friendly interface where users can explore a list of dogs presented in a GridView. Each dog card in the GridView displays basic information and an image. When a user selects a dog, they are navigated to a detailed view of that dog's profile, which includes:

- **Name**: The name of the dog.
- **Breed**: The breed of the dog.
- **Description**: A brief description of the dog.
- **Image**: A picture of the dog.
- **Lifespan**: The expected lifespan of the dog breed.
- **Origin**: The origin of the breed.

In the detail screen, users can save the dog's information to a local Hive database by clicking a save button. The saved dog details are displayed on a separate page using a List-Tile format, where users can also remove specific entries using a swipe-to-delete feature with `Slidable`.

Additionally, the app includes a search functionality that allows users to dynamically search for dogs by name and breed, enhancing the user experience by making it easier to find specific breeds.
