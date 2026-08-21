#!/bin/bash


greet() {
	echo "Hello, $1"
}

greet Sultan

add() {
	read -p "Enter first number: " x
	read -p "Enter second number: " y
	echo "Sum of two number $x & $y are $((x+y))."
}

add
