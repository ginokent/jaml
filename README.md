# jaml

command line "JSON to YAML" or "YAML to JSON" converter



### how to install and first run

```
# Install for Mac
sudo bash -c 'curl -fLR https://github.com/djeeno/jaml/releases/download/0.0.1/jaml_darwin_amd64 -o /usr/local/bin/jaml && chmod +x /usr/local/bin/jaml'

# Install for Linux
sudo bash -c 'curl -fLR https://github.com/djeeno/jaml/releases/download/0.0.1/jaml_linux_amd64 -o /usr/local/bin/jaml && chmod +x /usr/local/bin/jaml'

# Install for Windows
Invoke-WebRequest https://github.com/djeeno/jaml/releases/download/0.0.1/jaml_windows_amd64.exe -OutFile jaml.exe

# Get JSON
curl -fSs https://httpbin.org/get

# Convert JSON to YAML
curl -fSs https://httpbin.org/get | jaml

# Convert YAML to JSON
curl -fSs https://httpbin.org/get | jaml | jaml

# Convert JSON to YAML ...
curl -fSs https://httpbin.org/get | jaml | jaml | jaml
```
