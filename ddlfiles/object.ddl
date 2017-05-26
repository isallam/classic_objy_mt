#include <oo.h>
#include <string.h>




class TestObject:public ooObj
{
    public:
	ooVString name;
    
    TestObject()
    {
    }
    
    TestObject (char* n)
    {
        name=n;
    }
};
