# cython: profile=False
# distutils: language = c++
# cython: embedsignature = True
# cython: language_level = 3

from libcpp.string cimport string

cdef extern from "hello/hello.hpp":
    cdef void hello(const char* name) except +
    cdef int multiply(int a, int b) except +
    cdef string concat(const string& a, const string& b) except +

def example():
    s = 'Philip Cho'
    hello(s.encode('utf-8'))
    cdef string new_name = concat('John '.encode('utf-8'), 'Doe'.encode('utf-8'))
    hello(new_name.c_str())
