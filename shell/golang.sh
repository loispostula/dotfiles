if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v go &> /dev/null
    then
        brew install go
        exit
    fi

    if [ ! -f "$GOPATH/bin/powerline-go" ]; then
        go install github.com/justjanne/powerline-go@latest
    fi
fi
