# Minimal template for using C++ code from Python via Cython
## How to compile
1. Compile C++ code using CMake.
```bash
mkdir build
cd build
cmake ..
make
cd ..
```
2. Compile and install the Python module.
```bash
cd python/
python setup.py build_ext --inplace
python setup.py install
```
3. In a Python shell, try calling functions `example()`, `run()`, and `multiply()`:
```
In [1]: import hello

In [2]: hello.example()
Hello, Philip Cho!
Hello, John Doe!
Demonstrate buffer interface for std::vector<double>
  Fill std::vector<double> with {0, 1, ... 12}
  Take buffer interface of std::vector<double> and feed it into NumPy
  Success! The NumPy array has value [ 0.  1.  2.  3.  4.  5.  6.  7.  8.  9. 10. 11.] (dtype=float64)

In [3]: hello.run()
Hello, Philip Cho!
Hello, John Doe!
Demonstrate buffer interface for std::vector<double>
  Fill std::vector<double> with {0, 1, ... 12}
  Take buffer interface of std::vector<double> and feed it into NumPy
  Success! The NumPy array has value [ 0.  1.  2.  3.  4.  5.  6.  7.  8.  9. 10. 11.] (dtype=float64)

In [4]: hello.multiply(2, -3)
Out[4]: -6
```
