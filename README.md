# flutter_fintech

- Unit tests and widgets test in the ```test/``` folder: run the test with ```flutter test```
- Integration tests in the ```test_driver/``` folder: run the tests with ```flutter drive --target=test_driver/app.dart
```

#### Notes about widget sizes:
Some people are ok with big widgets but it can impact readability and make writing tests difficult, some likes dividing everything into very small widgets but you can end up with tons of little files and makes it unconvenient to navigate the widget tree.
I like a compromise: The widget size depends on how easy to test it will be, and I also try to keep my file roughly under 100 lines of code.
