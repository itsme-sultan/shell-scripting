#!/bin/bash

echo "Defining a function which uses local variable."


fun_local() {
	echo "Local variable: "

	local name="Sultan"
	echo "Hello dosto, This is $name"

}


fun_local

echo #blank line

echo "calling local variable outside of the function."
echo "Hello dosto, This is $name"



echo #blank line

fun_global() {
	echo "global variable: "
	y=25
	echo "My age is $y"
}

fun_global

echo #blank line

echo "Calling variable outside of the function."
echo "My age is $y" #Y is accessible here also.
