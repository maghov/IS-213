## Table of Contents

* [Room Booking Application](#room-booking-application)
* [Getting Started](#getting-started)
   * [Prerequisites](#prerequisites)
   * [Installation](#installation)
   * [Getting started with tests](#getting-started-with-tests)
* [Deployment](#deployment)
* [Contributing](#contributing)
* [Built With](#built-With)
* [Authors](#authors)
* [License](#license)
* [Acknowledgments](#acknowledgments)

## IS-213
## Room Booking Application
This is an open source project for managing room reservations (focusing currently on only our school which is the University of Agder in Kristiansand, Norway). There are several campus buildings with different equipment and room sizes. Our goal is to optimise the booking system for students by having a way to confirm whether a room is being used or not making it easier to see which rooms are available. The project is currently a work in progress and is in no way finished. This being an MIT licenced project it is open to the public where people are free and encouraged to help and contribute. This also being a school project, we have taken the oppurtnity to learn a new language, which is Swift 3.1 in our case. We have little to no background of working with Xcode or Swift, so any help on this project is greatly appreciated.

## Getting Started
These instructions will help you get the project up and running on your local machine for development and testing purposes. See our [installation wiki page](https://github.com/maghov/IS-213/wiki/Installation) for a video instruction on how to deploy the project on a live system.

## Prerequisites
Software that needs to be installed
```
Cocoapods 
Xcode 8.3.2
Swift 3
Firebase 
```

## Installation
In order to get started and help us out in this project certain steps need to be taken to get the program up and running on your computer. Currently, this project is only developed on Xcode and Windows integration has not been implemented as of this moment. 
This project was written within Xcode version 8.3.2 and using the Swift 3 language, please try to use these versions as they are guaranteed to be compatible with the code available on GitHub, older and or eventual newer versions may have different results, so we recommend sticking to Xcode 8.3.2 and Swift 3.

Check out our [Wiki!](https://github.com/maghov/IS-213/wiki) page if you wish for more detailed instructions

#### The first step is to download Xcode onto your machine, this can be done by the following steps: 
1.	Open the App Store app on your Mac (by default it’s in the Dock).
2.	In the search field in the top-right corner, type Xcode and press the Return key.
3.	The Xcode app shows up as the first search result.
4.	Click Get and then click Install App.
5.	Enter your Apple ID and password when prompted.
6.	Xcode is downloaded into your /Applications directory. (Apple, 2017)

#### The second step is to have [Cocoapods](https://cocoapods.org) installed on your machine, this is done by typing in the following command into your terminal: 

```$ sudo gem install cocoapods```

#### The third step is to get Firebase up and running on your system, this is done so by following these steps: 
[For now, please follow the documentation from the actual fire base google website on how to get it up and running - a more detailed step by step guide for this project is on the to do list]( https://firebase.google.com/docs/ios/setup)

## Deployment 
Once all the necessary programs are installed on your local machine, you may then clone or download the project directly from our GitHub. This can be done in three different ways

1. The first way of cloning our project is by cloning it via the command line in Terminal. This can be done by typing the following code in terminal: 

 ```git clone git@github.com:maghov/IS-213.git```
 
 2. The second way is by downloading a zip file directly from our Github and extracting the downloaded files from the Zip folder
 
 3. The third way is by doing it directly from within Xcode. This can be done by accessing the "Source Control" meny, and choosing the "Pull Request" option. 
 
Once the project is on your machine, you must navigate to the downloaded folder and run the "LoginV1.xcodeproj" file. This will open up the project directly on Xcode. Afterwards you must run the project in order for it to compile, and test to see if everything builds correctly. 

## Getting started with tests
Currently, an Ad-hoc testing appraoch was mainly used throughout the development of our project. We require contributors to help us create unit test functions. Please refer to our [Wiki!](https://github.com/maghov/IS-213/wiki) page for an introduction guide on how you can get started by creating your own unit tests. 

## Contributing
We appreciate all types of contributors that wish to help us in this project. Programming skills are not a necessity, and people with different types of backgrounds are welcome to contribute. [Please refer to our contrubuting page](https://github.com/maghov/IS-213/wiki/Contributing) on our [Wiki!](https://github.com/maghov/IS-213/wiki). Here you will find the different ways in how you may help us contribute on our project.

## Built With

* [Cocoapods](https://cocoapods.org) - Libraries for Xcode
* [Xcode](https://maven.apache.org/) - Programming platform used to develop this application
* [Firebase](https://firebase.google.com) - Database used for our system

## Authors

* Magnus Høvik 
* Erik Angell Berg 
* Eirik Oliversen
* Mohammad Hussain
* John Jensen


## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/maghov/IS-213/blob/master/LICENSE.txt) file for details

## Acknowledgments

* https://www.youtube.com/watch?v=dfg17snfcq8 
* http://www.appcoda.com/qr-code-reader-swift/ 
* https://www.youtube.com/channel/UC-d1NWv5IWtIkfH47ux4dWA
* [GettingStarted/DevelopiOSAppsSwift](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1)
* https://www.youtube.com/channel/UCDIBBmkZIB2hjBsk1hUImdA
* https://www.youtube.com/channel/UCuP2vJ6kRutQBfRmdcI92mA
