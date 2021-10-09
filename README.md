# Caesar Cipher Mobile App
In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques.

* For more info: https://en.wikipedia.org/wiki/Caesar_cipher 
* Web Sample: https://www.dcode.fr/caesar-cipher
* Mockup https://www.figma.com/file/RkGJlxvvZHbq6crfg33YW8/Untitled?node-id=0%3A1

## Purpose & Goal
This project will serve as demo app for assestment and portfolio of the developer. Future updates will be applied and will be hosted in playstore. The goal is create an app that processes two flows in two different pages, using APIs.
* Generates random words, then encodes them using the caesar cipher
* Generates an encoded sentence showing the shift, an asks the user to decode i
* ![alt text](https://i.imgur.com/dNjhLYy.png)

## Flow Chart
* Web Sample: https://drive.google.com/file/d/1fpVBkmqj9t_YdCFj4U1LQUMptP1cL6lJ/view?usp=sharing
* ![alt text](https://i.imgur.com/obyKTcW.png)



## How to Use the App
**Step 1:**
Enter the number of words that you want to be encoded. The words is automatically generated together with a random shift
![alt text](https://i.imgur.com/4lEOj3v.jpg)

**Step 2:**
Click the button Checker below to go to the checker feature then click the button Generate Code

**Step 3:**
Type the your answer to the textbox at the right side then click Validate

![alt text](https://i.imgur.com/7K0o49G.jpg)

The result will be shown below
![alt text](https://i.imgur.com/sNQz3B1.jpg)

### Up-Coming Features:

* Separate App for Generating Code and Checking
* Custom Words to encrypt
* Encoded phrases will be saved in a local storage


### Libraries & Tools Used

* State Management https://pub.dev/packages/get_it
* State Managment https://pub.dev/packages/get_it_mixin
* Random Numbers of http://www.randomnumberapi.com/
* Random Phrase https://random-word-api.herokuapp.com/home

### API 
* State Management https://pub.dev/packages/get_it
* State Managment https://pub.dev/packages/get_it_mixin
* Posman https://www.getpostman.com/collections/5f64bd774af33b0cebad

### Project Management Tool 
* https://tree.taiga.io/
* https://tree.taiga.io/project/ialexies-caesar-cipher/timeline


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
|- main.dart
|- locator.dart
|- cipher_notifier.dart

lib/app/
|- components/
|- constants/
|- data/
|- modules/
|- routes/

```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
2- data - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
3- stores - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI. 
4- ui — Contains all the ui of your project, contains sub directory for each screen.
5- util — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
7- routes.dart — This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_theme.dart
|- dimens.dart
|- endpoints.dart
|- preferences.dart
|- strings.dart
```

### Data

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories `local`, `network` and `sharedperf`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

```
data/
|- local/
    |- constants/
    |- datasources/
    |- app_database.dart
   
|- network/
    |- constants/
    |- exceptions/
    |- rest_client.dart
    
|- sharedpref
    |- constants/
    |- shared_preference_helper.dart
    
|- repository.dart

```

