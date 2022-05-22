#!/usr/bin/env bash

# clj -M --main cljs.main --compile hello-world.core --repl

java -cp cljs.jar:src cljs.main --compile hello-world.core --repl
