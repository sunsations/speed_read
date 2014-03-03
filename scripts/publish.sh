#!/usr/bin/env bash
gem build speed_read.gemspec && gem push `ls -1 speed_read-0.0.* | tail -n1`
