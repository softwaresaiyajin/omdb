## Overview
This application demonstrates the programming skills of the developer. 

## How to Run
- Clone/download the repository, stay in main branch
- Open **omdb.xcworkspace**
- Wait for dependencies to get resolved
- Select **OmdpApp** scheme and run

## Architecture
The application is built on MVVM+RS, a modular architecture approach. This enables developers to strictly separate the features in an application into smaller components. This eliminates tight-coupling making the application testable and more manageable. Below are the components of the architecture:

- MVVM - this is the Model-View-Viewmodel design pattern. With the development of Rx libraries for iOS, data bindings are now possible. In this architecture, the developer considers each screen in an application as a feature and is put to its own module.

- Router - modular architecture won't be possible if controllers are tightly-coupled to one another. To eliminate that, a navigation module is needed. This handles all navigation-related processes in the application.

- Storage - Apple supports multiple platforms: iOS, macOS, watchOS and tvOS, the views associated with each platform may be different due to design guidelines or target user experiences but the data you'll be providing to your applications, if you plan to support platforms other than iOS, will almost be the same. For reusability, you should put all data-related objects into a single module. This usually handles network operations, mapping, caching and peristence logic.

## Project structure

- Xcode workspace is used to bind the modules, thus, making it easier for developers to navigate the project.
- Each module has its own demo project, which is used to test the feature before integrating it to application layer, this enables faster developer testing since developers won't have to navigate sets of screens just to debug a specific feature.
- The applayer binds the modules using navigation and data modules.

## Protocol Conformances

- Protocols are suffixed with 'Protocol' so it will be easy to distinguished and declarative as well.
- The functions and variables are prefixed with string that refers to the module (ie, hm_ for HomeModule) to eliminate ambiguity with other protocol conformances in the future because  it is possible that other module's protocols has the same name of variables and/or functions, 

## Technologies

Below are libraries used in developing the application:

- Carthage - dependency management
- RxSwift - functional operations
- RxCocoa - RxSwift UI bindings
- RxDataSources - RxSwift UI bindings for multi-sectioned data
- [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide) - coding standards

## To Do's
- Unit testing - TDD is an ideal approach, but due to time constraints (holiday season), this was not implemented
- Swinject for dependency injection
- Bitrise for CI/CD

## Where to Next?

For a more detailed modular approach demonstration, you may visit this [tutorial](https://github.com/softwaresaiyajin/ios-modular-app-demo).

