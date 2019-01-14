module sdlraii.testmock.util;

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