package main

import (
	"flag"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello, World!"))
}

func main() {
	port := flag.String("port", "8080", "port to listen on")
	flag.Parse()

	log.Printf("Serving on HTTP port: %s\n", *port)
	http.HandleFunc("/", handler)
	err := http.ListenAndServe(":"+*port, nil)
	if err != nil {
		log.Fatal(err)
	}
}
