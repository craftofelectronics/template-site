#!/bin/bash

ls src/*.tex | sed -e s/src\\/// | sed -e s/.tex// 

