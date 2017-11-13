# Debuddy 🤖

## What is it?

> A debug menu or debug mode is a user interface implemented in a computer program that allows the user to view and/or manipulate the program's internal state for the purpose of debugging.

Debuddy is a _customisable_ debug menu for your iOS projects. 

## Why would I use it?

### Potential use cases

#### Separating debugging code
Often when working on a project you might tie functionality you're developing to already existing parts of your codebase, therefore muddying tested production code with debug code. 
With Debuddy, your debugging code can be kept separate.

#### Resetting your app
Generally an app needs to be uninstalled to clear your app’s data. 
With Debuddy, you could clear this data by passing in a closure that resets whatever persistence method your app is using and resets the state of the app. 

## Installation
Debuddy can be installed with Cocoapods. 

## Usage

### Presenting the window
Debuddy has an out of the box solution to present the window, although if needed you can customise it.

#### The easy way
Attach your window to Debuddy, a gesture is attached to this window that allows you to show Debuddy with a double 2 finger tap.
All you need is 1 line
`Debuddy.shared.addDebuddyToWindow(window)`

#### Custom gesture
If your app conflicts with a double 2 finger tap but you'd still like global access with a gesture, you can assign your own gesture to Debuddy.
e.g.
```
let gesture = UITapGestureRecognizer(target: Debuddy.shared, action: #selector(Debuddy.shared.showDebuddy))
...
Debuddy.openDebuddyGesture = customGesture
```

#### Calling `showDebuddy`
If you'd rather explicitly call to show Debuddy, you can just call `Debuddy.shared.showDebuddy()` instead.

### Setting your debug invokables
Debuddy is populated with an array of `Invokable` types. Just set the `invokable` array on Debuddy and the debug menu will be populated with your invokable methods.

e.g.
```
Debuddy.shared.invokables = [
	DebugHandler(title: "Clear user defaults") {
		// Closure code here
	},
	DebugHandler(title: "Begin custom animation for debug") {
		// Closure code here
	}
]
```

## Caveats
You should ensure that Debuddy is not compiled into your production binary. 
Debuddy purposely leaves this to you because every project configuration is different. 

Use of Debuddy is at your own risk.

## Next steps
In the pipeline:

- Info tab to display: version number, build number, iPhone 
version, iOS version. 
- Customisable info in info tab
- Expanded debug cell types such as a slider to return a value and a Boolean switch
