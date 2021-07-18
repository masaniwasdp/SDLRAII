module sdlraii.testmock.util;

version (sdlraii_testmock)
{
    struct FunctionMock(R)
    {
        R opCall() { callcount++; return value; }

        R value;

        ushort callcount;
    }

    struct FunctionMock(R : void, T1)
    {
        R opCall(T1) { callcount++; }

        ushort callcount;
    }
}