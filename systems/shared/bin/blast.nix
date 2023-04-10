_:
''
#!/usr/bin/env bash

temp="/tmp/ss-$(date +%Y%m%d-%H%M%S).png"

case "$1" in
   "sel")
      shotgun $(hacksaw -f '-i %i -g %g') $temp ;;
   "scr")
      shotgun $temp ;;
   "del")
      sleep 3; shotgun $temp ;;
esac

xclip -se c -t image/png -i $temp
''
