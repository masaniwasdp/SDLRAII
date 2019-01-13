module sdlraii.testmock.framework;

template DefineStruct(string N)
{
    immutable DefineStruct = `struct ` ~ N ~ `{}`;
}

template DefineFunctionMock(string N, string R)
{
    immutable DefineFunctionMock = `FunctionMock!(` ~ R ~ `) ` ~ N ~ `;`;
}

template DefineFunctionMock(string N, string R, string T1)
{
    immutable DefineFunctionMock = `FunctionMock!(` ~ R ~ `, ` ~ T1 ~ `) ` ~ N ~ `;`;
}

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