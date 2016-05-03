# Trial Lang 2

## Syntax

```lisp
(namespace sub)
=> sub

(def (%add:int a:int b:int)
  (+ a b))
=> %add

(def (Add:int a:int b:int)
  (%add a b))
=> Add
```

```lisp
(namespace main)

(def global-variable 1)

(print (sub.Add global-variable 2))

(defstruct sample
  (a b))

(def (initialize self:sample a:int b:int)
  (set self.a a)
  (set self.b (+ b 1)))

(def (add:int sample:sample)
  (+ sample.a sample.b))

(print (add (new sample 1 2)))

(print (add (sample.new 2 4)))
```
