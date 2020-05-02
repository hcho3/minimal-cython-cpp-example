#include <string>
#include <vector>

extern "C" {
void hello(const char* name);
int multiply(int a, int b);
}

std::string concat(const std::string& a, const std::string& b);

struct PyBufferInterface1D {
  void* buf;
  char* format;
  size_t itemsize;
  size_t nitem;
};

class MyObj {
 private:
  std::vector<double> field_;
  const char* format;
 public:
  MyObj() : format("d") {}
  ~MyObj() = default;
  void FillToN(int n);
  PyBufferInterface1D GetBufferInterface();
};
