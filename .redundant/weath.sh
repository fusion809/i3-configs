#!/run/current-system/sw/usr/bin/env bash
wget -cqO- http://www.weatherzone.com.au/qld/lower-burdekin/townsville | grep "icon-forecast-large weathericons" | cut -d '=' -f 3 | cut -d '"' -f 2 > cond.txt
wget -cqO- http://www.weatherzone.com.au/qld/lower-burdekin/townsville | grep tempnow | cut -d '>' -f 2 | sed 's|</span||g' | sed 's|&deg;|°|g' > temp.txt
