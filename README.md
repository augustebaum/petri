# petri

Petri nets in Typst.

## Examples

![](/tests/four-seasons/ref/1.png)
![](/tests/large-example/ref/1.png)
![](/tests/relative-positioning/ref/1.png)
![](/tests/two-concurrent-processes/ref/1.png)

Find the full list of examples in the [tests](/tests/README.md) directory. Yes, the examples are just rendered tests!

## TODO
- [ ] Things like `node-defocus` seem to have no effect
- [ ] See if it's possible to change styles using CeTZ's `set-style` (hard to say out loud!)
- [ ] Make the fact that the label moves not change the edge behaviour (in particular, make it possible for an edge to behave as though the label was not there)
- [ ] Refactor places and transitions to custom CeTZ shapes, which can then be used to define custom fletcher shapes
  - [ ] Maybe don't focus so much on fletcher in general?
- [x] Example gallery (render the tests)
- [ ] Show 4 comprehensive examples in the top-level README
