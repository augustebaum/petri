# petri

Petri nets in Typst.

## Examples

![](/tests/fletcher/relative-positioning/ref/1.png)
![](/tests/fletcher/four-seasons/ref/1.png)
![](/tests/fletcher/two-concurrent-processes/ref/1.png)
![](/tests/fletcher/large-example/ref/1.png)

Find the full list of examples in the [tests](/tests/README.md) directory. Yes, the examples are just rendered tests!

## TODO
- [ ] Things like `node-defocus` seem to have no effect
- [ ] Make the fact that the label moves not change the edge behaviour (in particular, make it possible for an edge to behave as though the label was not there)
- [ ] Refactor places and transitions to custom CeTZ shapes, which can then be used to define custom fletcher shapes
  - [x] Add CeTZ shapes
  - [ ] Maybe don't focus so much on fletcher in general?
  - [ ] See if it's possible to change styles using CeTZ's `set-style` (hard to say out loud!)
- [x] Example gallery (render the tests)
- [x] Show 4 comprehensive examples in the top-level README
