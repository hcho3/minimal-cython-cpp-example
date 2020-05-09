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

In [3]: hello.run()
Hello, Philip Cho!
Hello, John Doe!

In [4]: hello.multiply(2, -3)
Out[4]: -6
```
