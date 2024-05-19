# richar_cangui

Richar Cangui portfolio

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# richar_cangui_portfolio
[live example](https://richarcangui.com)


## How Build 

This project use the strategy --dart-define-from-file to define env variables, so you need to create a file called env.json in the root of the project and add the variables in env.json.template

To run:
 ```
    flutter run --dart-define-from-file=env.json
 ```

## How setup local CI/CD
* Create a folder called web_builder in the root of the project.
* Create a new project in our github account called web_builder.
* Important! Setup git and connect with the new project in the folder web_builder.
* Continue with the next steps.

## How deploy

* This project contains a automatic deploy in local
* To deploy in production you need open terminal and run the command:
    ```
        make deploy-web
    ```