#!/bin/bash

puppet apply manifests --modulepath modules "$@"
