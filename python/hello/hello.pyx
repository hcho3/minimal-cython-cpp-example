# cython: profile=False
# distutils: language = c++
# cython: embedsignature = True
# cython: language_level = 3

from libcpp.string cimport string
from libcpp.memory cimport unique_ptr

import numpy as np

cdef extern from "hello/hello.hpp":
    cdef void hello(const char* name) except +
    cdef int multiply(int a, int b) except +
    cdef string concat(const string& a, const string& b) except +

    cdef cppclass PyBufferInterface1D:
        void* buf
        char* format
        size_t itemsize
        size_t nitem

    cdef cppclass MyObj:
        void FillToN(int n) except +
        PyBufferInterface1D GetBufferInterface() except +

cdef class MyObjWrapper:
    cdef unique_ptr[MyObj] _handle
    cdef Py_ssize_t shape[1]
    cdef Py_ssize_t strides[1]

    def __cinit__(self):
        self._handle.reset(new MyObj())

    def __dealloc__(self):
        self._handle.release()

    def __getbuffer__(self, Py_buffer* buffer, int flags):
        cdef PyBufferInterface1D interface = self._handle.get().GetBufferInterface()
        cdef Py_ssize_t itemsize = interface.itemsize

        self.shape[0] = interface.nitem
        self.strides[0] = itemsize

        buffer.buf = interface.buf
        buffer.format = interface.format
        buffer.internal = NULL
        buffer.itemsize = itemsize
        buffer.len = interface.nitem * itemsize
        buffer.ndim = 1
        buffer.obj = self
        buffer.readonly = 0
        buffer.shape = self.shape
        buffer.strides = self.strides
        buffer.suboffsets = NULL

    def __releasebuffer__(self, Py_buffer* buffer):
        pass

    def fill_to_n(self, n):
        self._handle.get().FillToN(n)

def multiply_python(a, b):
    return multiply(a, b)

def example():
    s = 'Philip Cho'
    hello(s.encode('utf-8'))
    cdef string new_name = concat('John '.encode('utf-8'), 'Doe'.encode('utf-8'))
    hello(new_name.c_str())

    print('Demonstrate buffer interface for std::vector<double>')
    obj = MyObjWrapper()
    print('  Fill std::vector<double> with {0, 1, ... 12}')
    obj.fill_to_n(12)
    print('  Take buffer interface of std::vector<double> and feed it into NumPy')
    x = np.asarray(obj)
    print(f'  Success! The NumPy array has value {x} (dtype={x.dtype})')
