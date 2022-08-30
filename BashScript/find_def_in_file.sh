#!/bin/sh
global -ax $1 > global_output
vi global_output +/$1
