#include <iostream>
#include <string>
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
