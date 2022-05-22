## Overview
OMDB api demo app which uses modularization

## How to Run
- Clone/download the repository, stay in main branch
- Open **omdb.xcworkspace**
- Wait for dependencies to get resolved
- Select **OmdbApp** scheme and run

## Architecture
The application is built on MVVM+RS, a modular architecture approach. This enables developers to strictly separate the features in an application into smaller components. This eliminates tight-coupling making the application testable and more manageable. Below are the components of the architecture:

- FeatureLayer - this contains the screens in the app which is developed using MVVM design pattern. In this architecture, the developer considers each screen in an application as a feature and is put to its own package.

- ServiceAbstractionLayer - contains the interfaces of services, **FeatureLayer** uses these abstractions to interact with services.

- ServiceImplementationLayer - contains the concrete implementation of services. This decides which sdk/s to use to implement the use-cases needed in the app

- AppLayer - connects services and features.

- Routing - modular architecture won't be possible if views are tightly-coupled to one another. SwiftUI makes this a bit harder since it uses NavigationLink which needs to be supplied with destinationView. To solve, this an abstraction (see MovieListFeature.ExternalViewFactoryInterface) is created which returns a generic destination view. The **AppLayer** handles this it provides the needed destination views of each feature.

- Storage - Apple supports multiple platforms: iOS, macOS, watchOS and tvOS, the views associated with each platform may be different due to design guidelines or target user experiences but the data you'll be providing to your applications, if you plan to support platforms other than iOS, will almost be the same. For reusability, you should put all data-related objects into a separate package. In this demo app, no data needs to persist but if there is, RealmSwift will be used.

In Addition, we have the following:
- AppCore - contains reusable extensions and custom classes which are not related to UI
- AppUI - contains shared components, extensions and other things that are related to SwiftUI/UIKit

## Technologies

Below are libraries used in developing the application:
- SPM - library management
- Swinject - DI management
- [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide) - coding standards

## To Do's
- Testing - currently only done in OmdbSDK due to time-constraints
- Bitrise/Fastlane for CI/CD

## Where to Next?

For a more detailed modular approach demonstration, you may visit this [tutorial](https://github.com/softwaresaiyajin/ios-modular-app-demo).

