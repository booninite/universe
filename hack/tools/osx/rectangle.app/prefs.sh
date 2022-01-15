#!/usr/bin/env zsh

PLIST_FILE_NAME="com.knollsoft.Rectangle.plist"
RECTANGLE_PREFERENCES="$HOME/Library/Preferences/$PLIST_FILE_NAME"
DESTINATION="$UNIVERSE_HOME/hack/tools/osx/rectangle.app/$PLIST_FILE_NAME"

if [[ "$1" == "save" ]]; then
  rm -f "$DESTINATION";
  cp "$RECTANGLE_PREFERENCES" "$DESTINATION";
fi

if [[ "$1" == "apply" ]]; then
  rm -f "$RECTANGLE_PREFERENCES";
  cp "$DESTINATION" "$RECTANGLE_PREFERENCES";

  echo "dont forget to restart rectangle.app
  
  and figure out how to do it from this script"
fi  
