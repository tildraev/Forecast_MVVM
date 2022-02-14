# Forecast
In this project, you will update the MVC version of this app to an MVVM version.

Students who complete this project independently or as a pairing will showcase their understanding of the following principles:

* Basic Storyboard constraints
* UITableviews
* Functions
* Control Flow
* IBActions && IBOutlets
* API Calls
* API Documentation
* MVVM
* Abstraction
---

##  Before you begin
Please `Fork` then `clone` the repo. You can access the repo here:
https://github.com/Stateful-Academy/Forecast_MVVM

Create a local branch named `starter` and track the remote branch `starter`. 

To do this:
 * Open `Terminal`
 * Navigate to the correct `directory`
 * Type `git checkout --track origin/starter` 
	 * Hype
---
## Goals
We’ve been tasked with migrating the `design pattern` of this app from `MVC` to `MVVM`. Let’s quickly review how the patterns are structured.

MVC:

MVC is a pattern that separates the program into three main logical components: Model - View - Controller. MVC separates the `business logic` and the `presentation layer` from each other.

* Model
	* Stores Data
	* Model Initializer
* View
	* Views are created by the data gathered in the `Model`
	* Visual representation of the data
	* Receives user interaction
* Controller
	* Handles CRUD
	* Updates `Model`
	* Sends commands to `Model`
	* Sends commands to `View`

MVVM:

MVVM offered two-way data binding between a `view` and `view-model`. The `view-model` makes use of the `observer pattern` to make changes in the `view-model`.

* Model
	* Stores Data
	* Model Initializer
* View
	* Views are created by the data gathered in the `Model`
	* Visual representation of the data
	* Receives user interaction
* View-Model
	* Presents functions, commands, etc, to support the state of the `View`
	* Handles CRUD

#### Main Differences
| MVC                                                  | MVVM                                                         |
|------------------------------------------------------|--------------------------------------------------------------|
| One to many relationship between Controller and View | One to many relationship between View and View-Model         |
| View does not have direct reference to Controller    | Views references to the View-Model                           |
| MVC is Old school                                    | MVVM is New-school                                           |
| Difficult to test                                    | Debugging process may be more complicated when you have complex data bindings |
| Model can be tested directly                         | Code is event-driven which makes it easier to test           |

- - -
## Model

Our model as provided by the `starter` branch will not need to change. The concept of `Model` is the same with `MVC` and `MVVM`.

If you did not start from the `starter` branch, please build your model now via the documentation here [Weatherbit | 16 Day Forecast API Documentation](https://www.weatherbit.io/api/weather-forecast-16-day)

- - -
## Networking Controller

Our `Networking Controller` as provided by the `starter` branch will not need to change. This functionality is already decoupled from the `Model`

If you did not start from the `starter` branch, please build your `Networking Controller` now via the documentation here [Weatherbit | 16 Day Forecast API Documentation](https://www.weatherbit.io/api/weather-forecast-16-day)

Take a moment and reflect on the purpose of a `Model Controller` and what we would need for this project if building via `MVC`. How will that be different now that we are building using `MVVM`?


## View Model
 Create a new `.swift` file named `DayDetailViewModel`. Create the corresponding `class` upon that file.

Within this file we have a few goals. First, we need to create a 1:1 communication from the `ViewModel` to the `View` that will handle when the `View` should `update`. What did we learn during `Unit 3 - Communication patterns` that allow us to have a 1:1 communication pattern? We will need a few `properties` to hold the data we will use to display on the `View`

* Data to display
	* Top level dictionary
		* This has the value for `cityName`
* Days
	* The array of forecast data 
* Delegate
	* To inform the `View` when to update 

Because the `View-Model` file is now responsible for handling the `Model` what `CRUD` functions would we need? With this being a networking app we really only need one:

* fetchForcastData
	* Make the network call
- - -

With our goals late out let’s get to writing.

1. In the proper location on the file declare a `protocol` named `DayDetailViewDelegate`.
	1. Assign this `protocol` to only work with subclasses of `DayDetailsViewController`.
	2. Create a `protocol` method named `updateViews` with no parameters
2. Declare a local variable named `forcastData` with the type of an optional `TopLevelDictionary`
3. Declare a local variable named `days` that is a computed property
	1. Within the body of the completed property set the value to be the `days` array from the optional `forcastData`
	2. Use Swift's nil coalescing operator to use the value of an empty array if `days` is `nil`
4. Declare a `private` `weak` variable named `delegate` that is of type the `protocol` you declared earlier
	1. Should be optional
5. Declare a `private` constant named `networkingController` that is of type `NetworkingController`
	1. Do not set a value yet, nor make it optional. This will create errors, but we will solve them soon.
6. Create a method signature for a `fetchForcastData` `private` method
7. Capture the `initialization` of this file using the function `init()`
	1. Within the `parameters` of the `init` add two parameters
		1. delegate: The proper type
		2. networkController: The proper type
			1. Assign the default value of a `NetworkinController` initialized
	2. Within the `body` of this `init`
		1. Assign the local  `delegate`  to the `delegate` passed in via the `parameters`
		2. Assign the local `netowrkingController` to the `networkingController` from the `parameters`
		3. Call the `fetchForcastData()` function
8. The errors we create earlier should be solved
	1. For this file at least…
9. Now, complete the `body` of the `fetchForcastData` function
	1. Network call
		1. If success set the value for the local `forcastData`
		2. Tell the delegate to `updateViews`



- - -
## Update the views
Using the errors that Xcode is providing complete the app.

1. The cell file is complete and does not need to be changed
2. The VC needs to adopt and conform to the `protocol`
3. The VC needs a local property for the `View-Model`
4. The VC need to set the value for the local `View-Model` when the view has loaded
5. `days` now live on the `viewModel`

- - -

Found the bugs and everything is golden? Heck yeah! Submit your project.
