;; run clj and copy paste
;; or use vim
;; or use vscode, calva, and use CTRL-SHIFT-P to run "Calva Jack-in" - just choose "deps.edn"
;; make sure if u use vscode, the only open folder is this one, "crashcourse"
;; you can also use "Evaluate current form", etc
;; I highly recommend calva and vscode.


;; alternative: `clj -M:nrepl` lets you connect vim with a repl.
;; you can use "conjure" plugin with vim - https://www.youtube.com/watch?v=ZkJcVCW9GqY

(println "Hello world")

(+ 1 1)

(+ 3 3
   (* 2 2))

(+ 1 1 1 1)

11

12.0

(type false)

'someVar

;;vars
(def temp "someContent")

temp

(vector 1 2 3)

(def temp2 [1 2 "potato" false \c [3 4]])

temp2

(comment temp2)

(list 1 2 3)

;; lisp = list programming
'(1 2 3)

;; cant do that as 1 is not a function
;; (1 2 3)

(def temp-vector
  (vector 1 2 3))

(def temp-list
  (list 1 2 3))

;; these are both linkedlists, but 1 is a stack and 1 is a queue.
;; let's add to these lists
;; vector appends to the end, a list appends to the beginning.

(conj temp-vector 10)
(conj temp-list 10)

;;polymorphism
(coll? temp-vector) ;;yes
(seq?  temp-vector) ;;no
(coll? temp-list)   ;;yes
(seq?  temp-list)   ;;yes

(seq? (seq temp-vector)) ;;but we can make a vec a seq

(second temp-vector) ;; => 2


(hash-map "a" 1
          "b" 2)

(def temp-map
  {:strings [1 2 {"a" "b"}]
   :some-key :some-value
   :nested-thing {:another-key "value"}})

temp-map



