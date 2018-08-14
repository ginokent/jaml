# jaml

command line "JSON to YAML" or "YAML to JSON" converter



### how to install and first run

```
# OS and Architecture
GOOS=darwin  # or GOOS=linux or GOOS=windows
GOARCH=amd64 # require AMD64 Architecture CPU

# Install
sudo bash -c 'curl -fLR https://github.com/djeeno/jaml/releases/download/jaml-2018.8.1/jaml-'"${GOOS:?}-${GOARCH:?}"' -o /usr/local/bin/jaml && chmod +x $_'

# Convert JSON to YAML
curl -fSs https://status.github.com/api.json | jaml

# Convert YAML to JSON
curl -fSs https://status.github.com/api.json | jaml | jaml

# Convert JSON to YAML ...
curl -fSs https://status.github.com/api.json | jaml | jaml | jaml
```
