#include <string>

extern "C" {
void hello(const char* name);
int multiply(int a, int b);
}

std::string concat(const std::string& a, const std::string& b);
