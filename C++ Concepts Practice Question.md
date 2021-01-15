## Practice 0: Adding To Output
##### Design Description
- To print the integer on - output we generally use a statement like `cout<<5;`.  Make `cout+5;` statement to work as  `cout<<5;`
```c++
int main()
{
    cout+5;
    return 0;
}
```
Note: You are not allowed to change the main function. Write your code outside of the main.
- Output
```
5 
```
##### Concepts Targeted
- [Operator overloading](https://www.tutorialspoint.com/cplusplus/cpp_overloading.htm) which gives you a glimpse of how cout statement [works in C++ internally](http://www.vishalchovatiya.com/inside-the-cpp-object-model/).
## Practice 1: Summable Array
##### Design Description
- Design a class named array which works exactly like a primitive array. It should work like following :
```c++
class array
{

}

int main()
{
    array<int, 5> arr1 = {1, 2, 3, 4, 5};
    arr1[0] = 0;
    cout << arr1[0] << endl;

    array<int, 5> arr2 = {6, 7, 8, 9, 10};
    
    array<int, 10> arr3;

    arr3 = arr1 + arr2; // arr3 = {1,2,3,4,5,6,7,8,9,10}
    for (size_t i = 0; i < arr3.size(); i++)
    {
        cout << arr3[i] << " ";
    }
    cout<<endl;

    array<int, 5> arr4;
    arr4 = arr2 = arr1;


    for (size_t i = 0; i < arr4.size(); i++)
    {
        cout << arr4[i] << " ";
    }
    cout<<endl;
    return 0;
}
```
Note: You are not allowed to change the main function. Write your code within the design class.
- Output
```
0
0 2 3 4 5 6 7 8 9 10 
0 2 3 4 5
```
##### Concepts Targeted
- Operator([subscript](https://www.tutorialspoint.com/cplusplus/subscripting_operator_overloading.htm) & `+`) overloading
- Initializer list
- Template
- Template Specialization([see how template used in return-type-resolver implemented](http://www.vishalchovatiya.com/7-advanced-cpp-concepts-idiom-examples-you-should-know/#Return-Type-Resolver))
- [Assignment operator](http://www.vishalchovatiya.com/2-wrong-way-to-learn-copy-assignment-operator-in-cpp-with-example/)
- [Destructor](http://www.vishalchovatiya.com/inside-the-cpp-object-model/)

## Practice 2: Smart Pointer
##### Design Description
- Design a class named smart_ptr which works exactly like a primitive pointer. It should work like following 
```c++
class smart_ptr
{
};

int main()
{
    // 1. Should work with primitive data types
    smart_ptr<int> i_ptr(new int);

    *i_ptr = 5;

    cout << *i_ptr << endl;

    // 2. Should work with class & struct
    struct test
    {
        int var;
        test() { cout << "C\n"; }
        ~test() { cout << "D\n"; }
    };

    smart_ptr<test> t_ptr(new test);

    t_ptr->var = 10;

    cout << t_ptr->var << endl;

    // 3. Copy construction
    auto ptr = i_ptr;

    cout << *ptr << endl;

    // 4. Assignment chain
    i_ptr = i_ptr = i_ptr;
    return 0;
}
```
Note: You are not allowed to change the main function. Write your code within the design class.
- Output
```
5
C
10
5
D
```
##### Concepts Targeted
- [Operator(`->` & `*`) overloading](https://stackoverflow.com/questions/10677804/how-arrow-operator-overloading-works-internally-in-c)
- [Template](https://www.learncpp.com/cpp-tutorial/131-function-templates/)
- [Copy constructor](http://www.vishalchovatiya.com/all-about-copy-constructor-in-cpp-with-example/)
- [Destructor](http://www.vishalchovatiya.com/inside-the-cpp-object-model/)
- Concepts of [unique_ptr](http://www.vishalchovatiya.com/understanding-unique-ptr-with-example-in-cpp11/) & [shared_ptr](http://www.vishalchovatiya.com/move-constructor-assignment-operator-with-shared-ptr/) C++11
- [Shallow copy & deep copy](https://stackoverflow.com/questions/2657810/deep-copy-vs-shallow-copy)
- [Assignment chain](http://www.vishalchovatiya.com/2-wrong-way-to-learn-copy-assignment-operator-in-cpp-with-example/)

## Practice 3: Bank Account
##### Design Description
- Design a classes named account, saving_account & current_account as below. It should satisfy use cases mentioned in the main function.
```c++
class account
{

};

class saving_account
{

};

class current_account
{

};

double fixed_deposit_rate(account *ac)
{
    return (ac->type() == account::TYPE::SAVING) ? 6.5 : 4.0;
}

void delete_account(account *ac)
{
    delete ac;
}

void print_saving_account(account *ac)
{
    if (/* type casting condition to print saving account only */) // Do not use ac->type() method
    {
        cout << "holder : " << ac->holder() << endl;
        cout << "balance : " << ac->balance() << endl;
        cout << "interest rate : " << ac->interest_rate() << endl;
        cout << "FD rates : " << fixed_deposit_rate(ac) << endl;
    }
}

int main()
{
    saving_account *s_ac = new saving_account("John");
    s_ac->deposit(1000);
    s_ac->withdraw(100.30);
    print_saving_account(s_ac);
    delete_account(s_ac);
    cout << endl;

    current_account *c_ac = new current_account("Mathew");
    c_ac->deposit(10);
    c_ac->withdraw(100.30);
    print_saving_account(c_ac);
    delete_account(c_ac);
    cout << endl;

    return 0;
}
```
Note: You are not allowed to change the main function. Write your code within the design class.
- Output
```
holder : John
balance : 899.7
interest rate : 4.5
FD rates : 6.5
saving account of John deleted

current account of Mathew deleted
```
##### Concepts Targeted
- [Inheritance](http://www.vishalchovatiya.com/memory-layout-of-cpp-object/)
- [Virtual Method](http://www.vishalchovatiya.com/part-1-all-about-virtual-keyword-in-cpp-how-virtual-function-works-internally/)
- [Virtual Destructor](http://www.vishalchovatiya.com/part-3-all-about-virtual-keyword-in-c-how-virtual-destructor-works/)
- [Enumerated types](http://www.vishalchovatiya.com/21-new-features-of-modern-cpp-to-use-in-your-project/#Strongly-typed-enums)
- [Type of C++ casting](http://www.vishalchovatiya.com/cpp-type-casting-with-example-for-c-developers/)

## Practice 4: Real OOPs
##### Design Description
- Given a class A, we want to know at any given time, how many objects of class A live in heap memory.
```c++
class A
{

};

int main()
{
   A a1;
   A *a2 = new A;
   A *a3 = (A *)malloc(sizeof(A));
   cout << A::m_cnt << endl;
   delete a2;
   free(a3);
   cout << A::m_cnt << endl;
   return 0;
}
```
Note: You are not allowed to change the main function. Write your code outside of the main.
- Output
```
1
0
```
##### Concepts Targeted
- [Static data members in class & how to define & initialize them](http://www.vishalchovatiya.com/how-c-program-stored-in-ram-memory/).
- [Constructor & destructor](http://www.vishalchovatiya.com/inside-the-cpp-object-model/)
- [Memory allocation stack vs heap](http://www.vishalchovatiya.com/how-c-program-convert-into-assembly/)
- [Dynamic memory](http://www.vishalchovatiya.com/how-do-malloc-free-work-in-c/)
- [Diff b/w new/delete & malloc/free](https://stackoverflow.com/questions/240212/what-is-the-difference-between-new-delete-and-malloc-free)

## Practice 5: `this` pointer
##### Design Description
- There are some problems in following code identify it & fix it to produce output described. Also justify your changes & reason for changes.
```c++
struct test
{
public:
    static int static_var;
    int normal_var = 0;

    static void static_method()
    {
        static_var++;
        normal_var++;
        cout << "static_method called\n";
    }

    void normal_method()
    {
        static_var++;
        normal_var++;
        cout << "normal_method called\n";
    }

    void call_chain_1()
    {
        static_var++;
        normal_var++;
        cout << "call_chain_1 called\n";
    }

    void call_chain_2() const
    {
        static_var++;
        normal_var++;
        cout << "call_chain_2 called\n";
    }
};

int main()
{
    // Call test::static_method using function pointer here

    // Call test::normal_method using function pointer here

    // Chain calling
    test t;
    t.call_chain_1().call_chain_2();// This is correct syntax, do not change this. Fix these methods

    return 0;
}
```
Note: You are not allowed to call `static_method` & `normal_method` directly, rather you have to call it using function pointer as mentioned in `main()`.
- Output
```
static_method called
normal_method called
call_chain_1 called
call_chain_2 called
```
##### Concepts Targeted
- `this` pointer
- [Difference b/w static & non-static method](https://stackoverflow.com/questions/3903537/what-is-the-difference-between-a-static-method-and-a-non-static-method)
- static data members
- [const qualifier on `this` pointer](http://www.vishalchovatiya.com/when-to-use-const-vs-constexpr-in-cpp/)
- Method call chain
- [function pointer to static & non-static methods](https://stackoverflow.com/questions/14315346/function-pointer-of-a-non-static-member-function-of-a-class)

## Practice 6: Make code exception safe
##### Design Description
- Fix the following code & also specify reason for fix.
```c++
class base {
    bool m_is_throw = false;
public:
    base() {cout << "base\n";}
    base(bool is_throw): m_is_throw(is_throw) {cout << "base\n";}

    base(base &&) = delete;
    base(const base &) = delete;

    ~base() {
        cout << "~base\n";
        if (m_is_throw) throw std::exception{}; // Do not remove this statement
    }
};

class derived: public base {
    int *m_ptr;
public:
    derived(int y) 
    {
        cout << "derived\n";
        m_ptr = new int(y);        
        throw -1; // Do not remove this statement
    }

    derived(bool is_throw) : base(is_throw) {
        cout << "derived\n";
        throw std::logic_error{"Try to catch this...!"};
    }
    
    ~derived() {
        delete m_ptr;
        cout << "~derived\n";
    }
};

int main() {

    try {
        derived d(5);
        throw d; // Do not remove this statement
    } catch (base & b) {
        cout << "Caught base Exception\n";
    } catch (...) {
        cout << "Caught anything other\n";

        try {
            base b(true);
        } catch (std::exception & e) {
            cout << "Caught base Exception\n";
        }
    }

    // Can you catch the exception thrown by derived here in main? if yes how ?, if no why ?
    derived(true); 

    return 0;
}
```
Note: Do not remove the lines having comments, make sure that there is no memory leaks.

- Output
```
base
derived
~derived
~base
Caught anything other
base
~base
Caught base Exception
base
derived
terminate called after throwing an instance of 'std::logic_error'
  what():  Try to catch this...!
```
##### Concepts Targeted
- Exception handling in C++
- [Throwing exception from constructor](http://www.vishalchovatiya.com/7-best-practices-for-exception-handling-in-cpp-with-example/#throwing-an-exception-from-the-constructor-)
- [Importance of copy & move constructor](http://www.vishalchovatiya.com/7-best-practices-for-exception-handling-in-cpp-with-example/#copy-and-or-move-constructor-while-throwing)
- [Why you should not throw exceptions from de-structor?](http://www.vishalchovatiya.com/7-best-practices-for-exception-handling-in-cpp-with-example/#throwing-exceptions-out-of-a-destructor)
- [Best practices for exception handling in C++](http://www.vishalchovatiya.com/7-best-practices-for-exception-handling-in-cpp-with-example/#Best-practices-&-some-CPP-Core-Guidelines-on-exception-handling)
## Practice 7: Enforce the permission
##### Design Description
- Given following class limit the `Square` object creation to only `SquareFactory`.
```c++
class Square {
    uint32_t m_side{0};

public:
    Square(uint32_t s) : m_side{s}{}
    uint32_t area(){
        return m_side*m_side;
    }
};

class SquareFactory {
public:
    static Square create(uint32_t s){
        return {s};
    }
};

int main() {
    // Following statement should give compilation error
    // Square object should not be allowed to create directly
    // Rather it should be created using SquareFactory
    Square s1(5); // Comment once give compilation error

    auto s2 = SquareFactory::create(5);
    cout << s2.area() << endl;
    cout << s2 << endl;

    return 0;
}
```
Note: You are not allowed to change the main function.
- Output
```
25
25
```
##### Concepts Targeted
- [Use cases of friend keyword](https://softwareengineering.stackexchange.com/questions/68854/what-is-the-use-case-to-use-c-friend-class)
- [Factory Design Pattern](http://www.vishalchovatiya.com/factory-design-pattern-in-modern-cpp/)

## Practice 8: C++11 Move semantics
##### Design Description
- 
```c++
struct formatted_string {
    static int copy_cnt;    // Increment copy count in copy constructor & assignment operator
    int *m_is_capitalized = new int{false};
    string m_str;

    formatted_string(const char *str, int c = false) : m_str(str) { *m_is_capitalized = c; }

    // TODO
};

class dictionary
{
    vector<formatted_string *> m_words;

    void push_back() {}        // Fix: raw string
    void push_back() {}  // Fix: l-value
    void push_back() {} // Fix: r-value

public:
    void add() { } // Fix

    void print() {
        for (auto &&f_str : m_words) {
            if (f_str->m_is_capitalized) {
                for (auto &&c : f_str->m_str)
                    cout << toupper(c) << endl;
                cout << endl;
            }
            else
                cout << f_str->m_str << endl;
        }
    }
};

int main() {
    dictionary d;

    // TC 1
    d.add("dummy"); // raw string

    // TC 2
    d.add(formatted_string{"hello", true}); // r-value reference

    // TC 3
    formatted_string s1;
    s1 = formatted_string("world");
    d.add(s1);                      // l - value reference

    // Validation
    assert(s1.m_str == "world");             // make sure it isn't moved
    assert(formatted_string::copy_cnt == 1); // checking how many copies done so far
    d.print();
    return 0;
}
```
Note: You are not allowed to change the main function.
- Output
```
dummy
HELLO
world
```
##### Concepts Targeted
- [Copy Constructor](http://www.vishalchovatiya.com/all-about-copy-constructor-in-cpp-with-example/) & [Move Constructor](http://www.vishalchovatiya.com/move-constructor-assignment-operator-with-shared-ptr/)
- [Copy Assignment](http://www.vishalchovatiya.com/2-wrong-way-to-learn-copy-assignment-operator-in-cpp-with-example/) & [Move Assignment Operator](http://www.vishalchovatiya.com/understanding-unique-ptr-with-example-in-cpp11/)
- [Forwarding reference](http://www.vishalchovatiya.com/21-new-features-of-modern-cpp-to-use-in-your-project/#Forwarding_references) & `std::forward`
- [l-value & r-value reference](http://www.vishalchovatiya.com/lvalue-rvalue-and-their-references-with-example-in-cpp/)
