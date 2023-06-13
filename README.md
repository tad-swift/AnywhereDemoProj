# Anywhere Project Demo

In the demo project, I have demonstrated my code style and project architecture without the use of external dependencies or solutions.

The project contains two app targets, with the code for each in their specific folders. Each target also has tests. I have created two packages, one for shared business logic, and one for shared UI components, each well tested. No external sources or code snippets are used in this project. It is purely the culmination of my abilities as a developer from years of work.

The way I set up the packages structure of this project is for convience and ease of use; a real implementation can use a variety of different techniques, such as compiling shared code into frameworks, a separate Xcode project, distributing via version control, keeping the code within the same project, etc. By extracting the code into packages, we can share the code not just between the two apps, but with any Xcode project we desire.

I have purposely lagged behind in beautiful UI design to give more time to ensure functionality has been met, and good tests have been written to minimize the risk of code failures in the future. My philosophy is that UI can be beautified over time, but failing code will be extremely detrimental to any business.

### Apps
The modularity of my architecture can be seen when the apps have little to no custom logic inside them (for this demo project), they just consume the two swift packages wich already have most functionality built in.

### AnywhereDemoProjUI
In this package, I have built drop in solutions for UI, so that very little UI code needs to be written in the apps. This is a special circumstance of this project, which is why I chose to go in this direction. Most apps would not share all UI components like this, its important to know the requirements of your project so you can build it in a way that makes the most sense.
