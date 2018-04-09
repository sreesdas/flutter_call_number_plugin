# call_number_example

Demonstrates how to use the call_number plugin.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Usage

```yaml
# add this line to your dependencies
call_number: ^0.0.1
```

```dart

_initCall() async {
	await new CallNumber().callNumber('<phone_number>');
}

```