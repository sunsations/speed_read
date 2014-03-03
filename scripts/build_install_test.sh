#!/usr/bin/env bash
gem build speed_read.gemspec && gem install ./speed_read-0.0.2.gem && head -n 21 tea.txt | speed_read
