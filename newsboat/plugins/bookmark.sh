#!/bin/sh

url="$1"
title="$2"
feed_title="$4"

echo "${feed_title} - ${title} (${url})" >> ~/.newsboat/bookmarks.txt
