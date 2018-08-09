package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"gopkg.in/yaml.v2"
)

func unmarshaledDataToBytes(data interface{}) interface{} {
	switch d := data.(type) {
	case map[interface{}]interface{}:
		m := map[string]interface{}{}
		for k, v := range d {
			m[k.(string)] = unmarshaledDataToBytes(v)
		}
		return m
	case []interface{}:
		for i, v := range d {
			d[i] = unmarshaledDataToBytes(v)
		}
	}
	return data
}

// JAML convert JSON to YAML or YAML to JSON.
func JAML(bytes []byte) ([]byte, error) {
	var data interface{}

	// JSON
	if json.Valid(bytes) {
		if err := json.Unmarshal(bytes, &data); err != nil {
			return nil, fmt.Errorf("json.Unmarshal: %v", err)
		}

		b, err := yaml.Marshal(data)
		if err != nil {
			return nil, fmt.Errorf("yaml.Marshal: %v", err)
		}

		// add `---` to the first line.
		b = append([]byte("---\n"), b...)

		return b, nil
	}

	// YAML
	if err := yaml.Unmarshal(bytes, &data); err != nil {
		return nil, fmt.Errorf("yaml.Unmarshal: %v", err)
	}

	//b, err := json.MarshalIndent(unmarshaledDataToBytes(data), "", "\t")
	b, err := json.Marshal(unmarshaledDataToBytes(data))
	if err != nil {
		return nil, fmt.Errorf("json.Marshal: %v", err)
	}

	// add `\n` to the last line.
	b = append(b, []byte("\n")...)

	return b, nil
}

func main() {
	bytes, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		log.Fatalf("[ERROR] Input data is wrong: %v", err)
	}

	bytes, err = JAML(bytes)
	if err != nil {
		log.Fatalf("[ERROR] Failed to convert input data: %v", err)
	}

	fmt.Printf("%s", bytes)
}
