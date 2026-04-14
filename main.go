package main

import "fmt"

type VersionMessage struct {
	Version  int
	NodeName string
}

func main() {
	msg := VersionMessage{
		Version:  70015,
		NodeName: "node-A",
	}

	fmt.Println("invio messaggio version:")
	fmt.Println("%+v\n", msg)

}
