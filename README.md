# Random

![Swift](http://img.shields.io/badge/swift-3.1-brightgreen.svg)
[![CircleCI](https://circleci.com/gh/vapor/random.svg?style=shield)](https://circleci.com/gh/vapor/random)
[![Slack Status](http://vapor.team/badge.svg)](http://vapor.team)

A module for creating random bytes and numbers used in [Vapor](https://github.com/vapor/vapor)'s packages.

## Usage

```swift
import Random

let bytes = try URandom.bytes(count: 5)
print(bytes.string)

let int = try OSRandom.makeInt()
print(int)
```

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for instructions on how to use this package. 

## 💧 Community

Join the welcoming community of fellow Vapor developers in [slack](http://vapor.team).

## 🔧 Compatibility

This package has been tested on macOS and Ubuntu.
