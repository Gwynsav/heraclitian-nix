_:
''
#!/usr/bin/env bash

temp="/tmp/ss-$(date +%Y%m%d-%H%M%S).png"

case "$1" in
   "sel")
      maim -s $temp ;;
   "scr")
      maim $temp ;;
   "del")
      sleep 3; maim $temp ;;
esac

xclip -se c -t image/png -i $temp
''
