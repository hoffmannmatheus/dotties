#!/bin/bash

sudo node_modules/.bin/forever start -c node_modules/.bin/http-server public -p 80 -d False