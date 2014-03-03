#!/usr/bin/env bash
gem build speed_read.gemspec && gem install `ls -1 speed_read-0.0.* | tail -n1` && head -n 21 tea.txt | speed_read
