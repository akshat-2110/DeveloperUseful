http://www.ardendertat.com/2012/01/09/programming-interview-questions/
https://www.quora.com/Anyone-can-list-good-common-and-advanced-questions-for-testing-C++-STL-skill-during-interview
https://www.reddit.com/r/cpp/comments/fcqruv/c_quizzes/

-  time complexity for pushing the element in front for vector
- What is the 1st thing you do when you write an assignment operator? (A: Sanity Check for the same object).
- Why we use default constructor in C++?
- What is a shallow copy and deep copy? What is the problem with a shallow copy and
- Why do we need a deep copy?
- Write the code of copy constructor implementing deep copy? 
- What will happen if we pass by value in copy constructor parameter rather than pass by reference?
- When is copy constructor called?
- What are virtual functions? Explain how they work.
- What does explicitly do and why do we need it?
- What is typecasting? What are their types?
- What are the advantages of constructor with the initialization list? How it is better than writing the body of constructor? 
- Difference between malloc() and new?
- What is typecasting? What are their types? Explain each in single line use static_cast, const_cast, reinterpreted_cast, dynamic_cast.
- What is operator overloading, why is it used? Explain it with an example.
- Observe the code find out the problem
```c++
class base
{
public:
    int *ptr;
    base(int X)
    {
        ptr = new int(X);
    }
    ~base()
    {
        delete ptr;
    }
};

void print(base obj)
{
    cout << *(obj.ptr) << endl;
}

int main()
{
    base b1;
    print(b1);
    return 0;
}
```
- Observe the code & find out the problem
```c++
class base
{
public:
    int a;
    ~base()
    {
        cout << "~base()" << endl;
    }
};

class derive : public base
{
public:
    int *ptr;
    derive(int a)
    {
        ptr = new int(a);
    }
    void print(){}
    ~derive()
    {
        delete ptr;
        cout << "~drive" << endl;
    }
};

int main()
{
    base *b_ptr = new derive(1);
    cout << (b_ptr->a) << endl;
    b_ptr->print();
    delete b_ptr;
    return 0;
}
```
- Guess the output of following code
```c++
class Base
{
    virtual void method() { std::cout << "Base: method" << std::endl; }

public:
    virtual ~Base()
    {
        std::cout << "Base: destructor" << std::endl;
        method();
    }
    void baseMethod() { method(); }
};

class A : public Base
{
    void method() { std::cout << "A: method" << std::endl; }

public:
    ~A() { std::cout << "A: destructor" << std::endl; }
};

int main(void)
{
    Base *base = new A;
    //  base->baseMethod();
    delete base;
    return 0;
}
```
- How virtual destructor works? What is alternative solution to delete derived object with base object pointer without virtual destructor.? 
- Can we call virtual function from constructor? If yes then what will be the consequences of it. 
- How virtual table created when you declare an object using `new`(dynamically) 
- How virtual base class works internally? 
- Declare a static map in a class & populate it.Given a class, we want to know how many numbers of the object of that class is live in the heap area at a particular time.
  Note: Need to count object only exist in heap area for any particular time.
- What is implicit type conversion & explicit type conversion? 
- Why we use return by reference in the copy assignment operator function? 
- Can you directly assign/copy base object to derived class object like:
```c++
Base base;
Derived derived = base;
```
Can you directly assign derived class object to base class object like:
```c++
Base base
Derived derived;

base = derived;
```
Answer:
```c++
class A
{
};

class B
{
public:
    B(const A &rhs) { cout << "CC\n"; }

    B &operator=(const A &rhs)
    {
        cout << "ASSIGNMENT\n";
        return *this;
    }

    operator A()
    {
        cout << "TYPE-CAST\n";
        return A();
    }
};

int main()
{
    A a;
    B b = a; // calls constructor
    b = a;   // calls assignment
    a = b;   // calls type-cast operator
    return 0;
}
```
- What is meant by delegating constructor in C++11 ?
```c++
class A
{
public:
    int a = 0;
    A()
    {
        // cout<<"THIS double = "<<this<<"\n";
        a = 2;
    }
    A(int temp)
    {
        // cout<<"THIS int    = "<<this<<"\n";
        a = temp;
        A();
    }
};

int main()
{
    A a1(1);
    cout << a1.a << "\n";
    return 0;
}
```
- What is the output of the following code? Explain why?
```c++
struct A
{
    int a;
    A()
    {
        cout << "THIS\n";
        A::~A();
    }
    ~A()
    {
        cout << "THAT\n";
        A();
    }
};
int main()
{
    A a;
    return 0;
}
```
- Can we call constructor & destructor explicitly?
- Can we call constructor without an object?
- Can we call destructor without an object?
- Advantages and disadvantage of using `std::vector<>` in C++? 
- Use of `const` (5 distinct cases).
- Use of templates and nested templates. Definition of full and partial template specialization.
- Use of `constexpr` in C++11.
- `std::unique_ptr<>`, `std::shared_ptr<>` in C++11
- Write pre & post increment operator overloading. Why there is int in argument of post-increment operator overloading? how they called
[HINT](https://stackoverflow.com/questions/15244094/c-overloading-for-both-pre-and-post-increment)
- What will be the output of following program?
```c++
class temp
{
public:
    temp() { cout << "C\n"; }
    temp(int x) { cout << "PC\n"; }
    temp(const temp &rhs) { cout << "CC\n"; }
    temp operator=(const temp &rhs)
    {
        cout << "C=\n";
        return *this;
    }
    ~temp() { cout << "D\n"; }
};

void func(temp x) {}

int main()
{
    temp x = temp();
    // func(5);
    return 0;
}
```
- What is difference b/w `enum` & `enum class` from C++11? What are the benefit using enum class. Use enum class with inheritance which define storage size for enum.
- Find out the problem & fix it.
```c++
class IntADT
{
private:
    int m_val;

public:
    IntADT(int x) : m_val(x) {}
};

int main()
{
    IntADT obj(4);

    int x = obj;
    // int y = static_cast<float>(obj);

    std::cout << x;

    return 0;
}
```
- 1D or 2D array, what's faster? Static array & Dynamic array. 
- What is data structure used inside `std::list<>` & `std::deque<>`. What's difference between them? 
- Design a lamda function whose return type is long which accept vector as arg & return sum of elements. 
- Design your own `std::move` function. 
- Design a class having double pointer(kind of 2D matrix). Write copy constructor & assignment operator for the same. How to access nth index of mth row of pointer using class object(subscript operator). 
- Design a class like which works like auto keyword to deduce type. 
- Declare array of `std::unique_ptr`. 
- What is the use case of `std::weak_ptr`? Hint: cyclic dependency of shared_ptr
- Will following code works ? If yes then why?
1.
```c++
#include <iostream>
class A
{
    int something{0};

public:
    static void print1()
    {
        std::cout << "1 ?\n";
    }

    void print2()
    {
        std::cout << "2 ?\n";
    }
};
int main()
{
    A *a = nullptr; // Yes NULL!
    a->print1();    // Oops, what is this?
    a->print2();    // And this?
    return 0;
}
```
2.
```c++
#include <iostream>
struct MyClass
{
    void f() & // & is a ref qualifier
    {
        std::cout << "Version one of f()\n";
    }
    void f() && // && is a ref qualifier
    {
        std::cout << "Version two of f()\n";
    }
};
int main()
{
    MyClass c;
    c.f();
    std::move(c).f();
}
```
3.
```c++
#include <iostream>
int main()
{
    using MyInt = int; // Alias for int.
    MyInt i = 9;
    std::cout << "i = " << i << '\n';
    i.~MyInt(); // Ups, calling a destructor for int ??
}
```
- Can you copy values from a stack to a vector using STL in C++?
```c++
#include <stack>
#include <iostream>
#include <vector>
template <typename T, class C>
C &getProtectedContainer(std::stack<T, C> &s)
{
    struct OpenStack : std::stack<T, C>
    {
        using std::stack<T, C>::c;
    };
    return static_cast<OpenStack &>(s).c;
}
int main()
{
    std::stack<int> aStack; // uses deque<int>
    aStack.push(1);
    aStack.push(5);
    aStack.push(3);
    auto &c = getProtectedContainer(aStack);
    std::vector<int> v{c.begin(), c.end()}; // do the copy
    for (auto &val : v)
        std::cout << val << ' ';
    return 0;
}
// 1 5 3
```
- Why we need functor in C++?
- Design a method in a class which can accept both `lvalue` reference & `rvalue` reference within same method.
- Design a class having a method like emplace_back & construct another class emplace. For example design `addFoo` method for following class.
```c++
#include <iostream>
#include <vector>

struct foo
{
    foo() = default;
    foo(int i) : m_i(i) {}
    foo(int i, bool j, float k) : m_i(i), m_j(j), m_k(k) {}

    int m_i = 0;
    bool m_j = 0;
    float m_k = 0;
};

struct bar
{
    template <typename... Args>
    void addFoo(Args &&... args)
    {
        m_v.emplace_back(args...);
    }

    std::vector<foo> m_v;
};

int main(void)
{
    bar b;
    b.addFoo(5);
    b.addFoo(5, true, 5.5);
}
```
- How `std::forward(C++11)` is implemented?
- How to declare 2D smart pointer?
- What are the use case & meaning of `final`, `override`, `default` & `delete` keyword in C++?
- is below code works? if yes why ?
```c++
int const x = 42;
int &y = x;
```
- Will following code works?
```c++
template <typename T>
void dataType(T &&x)
{
    using type = T;
    type a = 0;
};
int main()
{
    dataType(0);

    int i = 0;
    dataType(i);
}
```
- Overload operator new & delete for derived class & base class & call it.
- Allocate an array of the object which has overloaded new & delete operator.
- While traversing vector using for loop i have erased one element from it. is it good idea ?
- Difference b/w list vs deque vs forward_list. Give an example of a use case for each.
- Diff b/w erase & remove in C++ STL?
- What is iterator invalidation?
- Suppose you have given a library in which you have to track the dynamic memory used by one class. How would you do that ?
- Why can't you throw exceptions from a destructor?
- Can you have an array of references?
- Write a small program, that will take a sequence of types and sum their sizeof's at compile time.
- Why avoid using `vector<bool>`?
- How to convert reverse iterator to iterator? 
- Design your own `std::make_unique` function
- Should I have to use `<=` operator in STL ? HINT: `X<=X` evaluates to true which is wrong
- Is this valid code ?
```c++
struct example
{
    example() {}
    example(example &&rhs) { cout << "MOVE\n"; }
    example operator=(example &&rhs) { cout << "MOVE=\n"; }
    ~example() { cout << "D\n"; }
};

example &&print()
{
    example x;

    return move(x);
}

int main()
{
    example temp = print();
    return 0;
}
```
- Declare reference to an array
- What is this code doing & why ? What will be output?
```c++
#include <cassert>
#include <iostream>

class God
{
private:
    int a;

public:
    God() noexcept {}
    // God() = default;
    God(int a, int b, int c, int d) noexcept : a{a} {}
    virtual ~God() noexcept {}

    void print_data() noexcept
    {
        std::cout << "Data: " << a << '\n';
    }

    virtual void who_am_i() noexcept
    {
        std::cout << "I'm a generic god!\n";
        print_data();
    }

    void *operator new(size_t size, void *ptr)
    {
        return static_cast<void *>(ptr);
    }
};

class Brahma : public God
{
public:
    // Brahma() noexcept {}
    Brahma() = default;

    void who_am_i() noexcept override
    {
        std::cout << "I am Brahma!\n";
        print_data();
    }

    static void change(God *god)
    {
        new (god) Brahma{};
    }
};

int main()
{
    God *god{::new God(1, 2, 3, 4)};
    god->who_am_i();

    Brahma::change(god);
    god->who_am_i();

    ::delete god;

    return 0;
}
```
- Provide the 5 new features introduced in C++11.
- Provide the 5 new features introduced in C++14.
- Provide the 5 new features introduced in C++17.
- Declare pointer to non-static member functions & call it.
- Write function having nested template type.
- Can constructor be protected ? if yes! why ?
- Why data member should not be public ?
- Can static virtual method possible ?
- How do you corrupt virtual table ?
- Can I Call Destructor Explicitly?(Yes, but you only want to do that when you have used placement new)
- Can I Use This Pointer In The Constructor?(Yes, but try to avoid calling virtual function from the constructor and passing this pointer from the initialization list to other classes.)
- Can The Destructor Be Pure Virtual Function?(Yes, but you still have to define it!)
