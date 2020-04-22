#include <cstdint>

class ArrayNN
{
private:
	int32_t** array;
	int32_t column_size, string_size;
	void create_array();
	void fill_array_NN();
public:
	ArrayNN();
	~ArrayNN();
	void output_array();
};