# Kill a rouge process running on a specific port
# usage: `killp 8000`
killp() { lsof -n "-i4TCP:${1:-3002}" | grep LISTEN | tr -s ' ' | cut -f 2 -d ' ' | xargs kill -9}
