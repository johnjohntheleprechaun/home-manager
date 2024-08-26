if [ -z "$1" ]; then
    echo "Usage: xdg-open <url>"
    exit 1
fi

wslview "$1"
