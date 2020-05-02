#include <iostream>
#include <string>
#include <vector>
#include <hello/hello.hpp>

void hello(const char* name) {
  std::cout << "Hello, " << name << "!" << std::endl;
}

int multiply(int a, int b) {
  return a * b;
}

std::string concat(const std::string& a, const std::string& b) {
  return a + b;
}

void
MyObj::FillToN(int n) {
  field_.clear();
  for (int i = 0; i < n; ++i) {
    field_.push_back(i);
  }
}

PyBufferInterface1D
MyObj::GetBufferInterface() {
  return PyBufferInterface1D{static_cast<void*>(field_.data()), const_cast<char*>(format),
                             sizeof(decltype(field_)::value_type), field_.size()};
}
