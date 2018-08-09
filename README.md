# jaml

command line "JSON to YAML" or "YAML to JSON" converter



### how to install and first run

```
# OS and Architecture
GOOS=darwin  # or GOOS=linux or GOOS=windows
GOARCH=amd64 # require AMD64 Architecture CPU

# Download
curl -fLR https://github.com/djeeno/jaml/releases/download/v2018.8.1/jaml-$GOOS-$GOARCH -o /tmp/jaml

# Add executable flag
chmod +x /tmp/jaml

# Run
curl -fSs https://status.github.com/api.json | /tmp/jaml
```

