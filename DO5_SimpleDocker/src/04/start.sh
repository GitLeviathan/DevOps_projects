#!/bin/bash

service nginx start
spawn-fcgi -p 8080 hello_world
/bin/bash
