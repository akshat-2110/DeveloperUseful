- You can easily compile following code.
```c++
#include <iostream>
int main() {
using namespace std;
http://www.google.com
int x = 5;
cout << x;
}
```
- Because, http is label.
- Find array size
```c++
template <typename T, size_t N> 
char (&ArraySizeHelper(T (&array)[N]))[N];
#define arraysize(array) (sizeof(ArraySizeHelper(array)))
```
instead of 
```c++
#define array_size(array)    sizeof(array)/sizeof(array[0])
```
- Do not use new-delete rather use smart pointers
- Do not use std::function rather use auto or lambda function
- Use lambda function rather than functor or predicate
- Use `std::exchange`(C++14) in move constructor & assignment operator
- Use user-defined literals wherever possible like `"0110"_bin`
```c++
unsigned long long operator"" _bin(const char *binArr, size_t len)
{
    unsigned long long res = 0;
    for (uint32_t i = len - 1; i >= 0; --i)
    {
    }
    return res;
}

int main(void)
{
    std::cout << "0110"_bin;
}
```
- Use tuple for short utility functions which returns multiple data.
```c++
std::tuple<string, int> getNameAge()
{
    return std::make_tuple("THIS", 34);
}

std::string name;
int age;
std::tie(name, age) = getNameAge();
```
- Higher order returning function or short functors:
```c++
const auto less_than = [](int x) {
    return [x](int y) {
        return y < x;
    };
};

int main(void)
{
    auto less_than_five = less_than(5);
    std::cout << less_than_five(3);
    std::cout << less_than_five(10);
    return 0;
}
```
- Benchmark
```c++
#define BENCHMARK(f)         \
    do                       \
    {                        \
        cout << #f << " = "; \
        benchmark(f);        \
    } while (0);

const auto benchmark = [](auto f) {
    std::chrono::steady_clock::time_point start = std::chrono::steady_clock::now();
    f();
    std::cout << std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::steady_clock::now() - start).count() << " microseconds\n";
};

void algorithm() {}

int main()
{
    BENCHMARK(algorithm);

    return 0;
}
```
- Use lambda function when you have the same repeated steps to perform on sanity check:
```c++
bool something::initialize()
{
    if (!init_step0())
    {
        std::cerr << "Step 0 failed\n";
        return false;
    }

    if (!init_step1())
    {
        std::cerr << "Step 1 failed\n";
        return false;
    }

    return true;
}

//=================================== INSTEAD ======================================

bool something::initialize()
{
    const auto try_step = [](const char *msg, auto f) {
        if (f())
            return true;
        std::cerr << msg << " failed\n";
        return false;
    };

    return try_step("Step 0", init_step0) && try_step("Step 1", init_step1);
}
```
- Avoid `lvalue` & `rvalue` reference overload, rather use forwarding reference
```c++
struct bar
{
    bar() = default;

    bar(const bar &rhs) { cout << "CC\n"; };
    bar(bar &&rhs) { cout << "MC\n"; };

    bar &operator=(const bar &rhs)
    {
        cout << "C=\n";
        return *this;
    };
    bar &operator=(bar &&rhs)
    {
        cout << "M=\n";
        return *this;
    };
};

struct foo
{
    bar m_bar;
    
    // void add_bar(bar& rhs)
    // {
    //     cout<<"lvalue ref\n";
    //     m_bar = rhs;
    // }

    // void add_bar(bar&& rhs)
    // {
    //     cout<<"rvalue ref\n";
    //     m_bar = move(rhs);
    // }

    template <typename T>
    void add_bar(T &&rhs)
    {
        cout << "combined ref\n";
        m_bar = forward<T>(rhs);
    }
};

int main(void)
{
    foo f;

    // 1. Passing lvalue reference
    bar obj;
    f.add_bar(obj);

    // 2. Passing rvalue reference
    f.add_bar(bar{});

    return 0;
}
```
- Remove space from C++ string using STL
```c++
int main()
{
    string input_string = "1         2  3   4 5 55 5     ";
    string::iterator new_end = unique(input_string.begin(), input_string.end(), [](const char &x, const char &y) {
        return (x == y and x == ' ') or (x != y and (x == ' ' or y == ' '));
    });

    input_string.erase(new_end, input_string.end());

    cout << input_string; // output: 12345

    return 0;
}
```
- Use containers of smart pointers instead of the container of the object or pointer to avoid copy.
```c++
struct dummy
{
    int a = 1;
    string s = "==";

    dummy() { cout << "C\n"; }
    ~dummy() { cout << "D\n"; }
};

void print()
{
    using spDummy = shared_ptr<dummy>;

    stack<spDummy> S;

    S.push(make_shared<dummy>());

    shared_ptr<dummy> spd(new dummy);

    S.push(move(spd));
}
int main()
{
    print();
    return 0;
}
```
- Unique interval search 
```c++
int main()
{
    set<pair<int, int>> intervals;

    intervals.insert({1, 2});
    intervals.insert({3, 4});
    intervals.insert({5, 6});
    intervals.insert({7, 8});
    intervals.insert({9, 10});

    //
    auto itLower = intervals.lower_bound({5, 0});
    if (itLower != intervals.end())
    {
        DEBUG(itLower->first);
        DEBUG(itLower->second);
    }

    //
    auto itUpper = intervals.lower_bound({5, 9});
    if (itUpper != intervals.end())
    {
        DEBUG(itUpper->first);
        DEBUG(itUpper->second);
    }

    return 0;
}
```
- How many time 5 is repeated ? or How many negative elements are there ? or Segregate elements
```c++
int main()
{
    // Sorted sequence
    std::vector<int> v = {-11, -2, -3, -1, 1, 2, 2, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 9};

    // How many time 5 is repeated ?
    auto itU = upper_bound(v.begin(), v.end(), 5); // >
    auto itL = lower_bound(v.begin(), v.end(), 5); // >=

    DEBUG(itU - itL);

    // How many negative elements are there ?
    itU = lower_bound(v.begin(), v.end(), 0); // >

    DEBUG(itU - v.begin());

    return 0;
}
```
Note: you can also use `std::equal_range()`
- Try to use pre-increment/decrement operator unless you require a post. As post increment/decrement operator has object overhead.
- Provide two best mangos out of 50 mangos
```c++
int main( )
{
   iv v = {9, 1, 8, 2, 5, 3};

   partial_sort(v.begin(), v.begin() + 2, v.end());// If order matters
   // nth_element(v.begin(), v.begin() + 2, v.end());// un ordered

   PRINT(v, cout<<i<<" ")

   return 0;
}
```
- Search on container sorted in descending order.
- Sum all the number in input
```c++
cout << "sum = "<< accumulate( istream_iterator<int>(cin), istream_iterator<int>(),0);
```
- Do not remove elements from a contiguous sequential container in for loop. It will lead to two things 
 1. Iterator invalidation 
 2. Shift all subsequent element which will take a performance hit

The right way to erase element from a container in a loop 
```c++
std::list<int> v = {1, 2, 3, 4, 5, 6, 7, 8, 9};

for (std::list<int>::iterator i = v.begin(); i != v.end(); /*++i*/)
{
    // if(*i==2) v.erase(i);
    if (*i == 2)
        v.erase(i++);
    else
        ++i;
}

for (auto &&i : v)
{
    cout << i << " ";
}
```
- Use sorting algo in following order performance wise
```
1. partition 
2. stable_partition 
3. nth_element 
4. partial_sort
5. sort
6. stable_sort
```
- Use `std::equal_range` algo in following condition:
    1. multimap same key element range, 
    2. duplicate remove from sorted range, 
    3. insert in a sorted range
```c++
   set<int> s = {1,2,3,5,6};

   auto itPair = equal_range(ALL(s), 4);

   if(itPair.first == itPair.second){// Element is not there
       DEBUG(*itPair.first);// Points to 5
       DEBUG(*itPair.second);// Points to 5
       s.insert(itPair.first,4);
   }
   else{
       DEBUG(*itPair.first);
       DEBUG(*itPair.second);
   }

   PRINT(s); // outputs: 1 2 3 4 5 6
```
- Avoiding use of strlen():
```c++
for (i=0; s[i]; i++) 
{ 
}
// loop breaks when the character array ends.
```
- C++ has inbuilt GCD function and there is no need to explicitly code it. Syntax: `__gcd(x, y);`
- Use of `emplace_back()`
- Calculating the number of digits directly
```
Number of digits in N = floor(log10(N)) + 1;
```
- C++11 has in built algorithms for following:
```c++
// are all of the elements positive?
std::all_of(first, first+n, ispositive());

// is there at least one positive element?
std::any_of(first, first+n, ispositive());

// are none of the elements positive?
std::none_of(first, first+n, ispositive());
```
- The algorithm `iota()` creates a range of sequentially increasing values, as if by assigning an initial value to first, then incrementing that value using prefix `++`.
```c++
int a[5] = {0};
char c[3] = {0};

std::iota(a, a + 5, 10);
std::iota(c, c + 3, 'a'); // {'a', 'b', 'c'}
```
- Rather than using iterator directly use ref to it like this 
```c++
for (auto i = v.begin(); i != v.end(); ++i)
{
    int &intRef = *i;
    // cout<<*i<<" ";
    cout << intRef << " ";
}
```
There is zero cost overhead
- Use structure unpacking feature of C++17
```c++
struct employee
{
    unsigned id;
    std::string name;
    std::string role;
    unsigned salary;
};

employee example;

auto &[id, name, role, salary] = example;

std::vector<employee> employees;

for (const auto &[id, name, role, salary] : employees)
{
    std::cout << "Name: " << name
              << "Role: " << role
              << "Salary: " << salary << '\n';
}
```
- Limit the scope of variable in `if()` & `switch()` statement 

1). `if()` statements: Imagine we want to find a character in a character map using the find method of `std::map:`
```c++
if (auto itr(character_map.find(c)); itr != character_map.end())
{
    // *itr is valid. Do something with it.
}
else
{ // itr is the end-iterator. Don't dereference.
} // itr is not available here at all
```
2). `switch()` statements: This is how it would look to get a character
from the input and, at the same time, check the value in a switch
statement in order to control a computer game:
```c++
switch (char c(getchar()); c)
{
case 'a':
    move_left();
    break;
case 's':
    move_back();
    break;
case 'w':
    move_fwd();
    break;
case 'd':
    move_right();
    break;
case 'q':
    quit_game();
    break;
case '0' ... '9':
    select_tool('0' - c);
    break;
default:
    std::cout << "invalid input: " << c << '\n';
}
```
How it works
```c++
{
    auto var(init_value);
    if (condition)
    {
        // branch A. var is accessible
    }
    else
    {
        // branch B. var is accessible
    }
    // var is still accessible
}
```
- Use `constexpr-if` instead of `enable_if`.
- Use fold expression(make sure of left fold, right fold & default value) when things needs to check recursively as follows
```c++
//Example 1: sum of all args
template <typename... Ts>
auto sum(Ts... ts)
{
    return (ts + ... + 0);
}

//Example 2: Check all args in range
template <typename T, typename... Ts>
bool within(T min, T max, Ts... ts)
{
    return ((min <= ts && ts <= max) && ...);
}

//Example 3: Push all elements in vector
template <typename T, typename... Ts>
void insert_all(std::vector<T> &vec, Ts... ts)
{
    (vec.push_back(ts), ...);
}

int main()
{
    std::vector<int> v{1, 2, 3};
    insert_all(v, 4, 5, 6);
}
```
- Use `map::insert` with hint iterator if the input sequence is somewhat predictable. to amortized `O(1)` insertion time.
- Use user-defined literals while dealing with real-world jargons/measurement-units 
```c++
// like in computer memory management units are in KB, MB or GB which can be defined as
using ull = unsigned long long;

constexpr ull operator"" _KB(ull no)
{
    return no * 1024;
}

constexpr ull operator"" _MB(ull no)
{
    return no * (1024_KB);
}

int main()
{
    cout << 1_KB << endl;
    cout << hex << 1_MB << endl;
}
```
- `lexical_cast` for the conversion of primitive data types
```c++
template<class RET, class ARG>
RET lexical_cast(const ARG &arg)
{
 RET ret;
 std::stringstream ss;

 ss << arg;
 ss >> ret;

 return ret;
}
int main(){
   int a=5;
   float b = 6.6;
   char c = 'a';

   cout<<lexical_cast<string>(a)<<endl;
   cout<<lexical_cast<string>(b)<<endl;
   cout<<lexical_cast<string>(c)<<endl;
   cout<<lexical_cast<int>("123")<<endl;

}
```
- Use symbol table like RPN calc
- Binary conversion
```
- Convert int to binary string

e.g. std::string binary = std::bitset<32>(128).to_string();

- Convert binary string to int

e.g. unsigned long decimal = std::bitset<8>(binary).to_ulong();

- Convert hex string to int

e.g. cout << stoll("1F", nullptr, 16) << endl;

can also use stoi, stol which is added from C++11

- Convert int to hex string

e.g. std::stringstream sstream;
    sstream << std::hex << 15;
    std::string result = sstream.str();

```
- Assign value to containers by intializer list
```c++
int main()
{
   pair<ll, ll> p = {1, 2};
   tuple<ll, ll> t = {1, 2};
   vector<ll> v = {1, 2, 3, 4, 5};
   set<ll> s = {1, 2, 3, 4, 5};
   list<ll> l = {1, 2, 3, 4, 5};
   deque<ll> d = {1, 2, 3, 4, 5};
 
   array<ll, 5> a = {1, 2, 3, 4, 5};
 
   // Wont work for adapters
   // stack<ll> s = {1, 2, 3, 4, 5};
   // queue<ll> q = {1, 2, 3, 4, 5};
   // priority_queue<ll> pq = {1, 2, 3, 4, 5};
 
   return 0;
}
```
- Some built-in functions(may directly access hardware as most of these are impemented as special instruction)
```c++
int main()
{
   DEBUG(__gcd(18, 27));         //GCD
   DEBUG(__builtin_ffs(8));      //Find First Set (int/long/long long)
   DEBUG(__builtin_clz(8));      // Count Leading Zero (int/long/long long)
   DEBUG(__builtin_ctz(8));      // Count Trailing Zero (int/long/long long)
   DEBUG(__builtin_popcount(7)); // Number Of Set Bits (int/long/long long)
 
   return 0;
}
```
- Print matrix more efficiently
```c++
for(i = 1; i <= n; i++) {
   for(j = 1; j <= m; j++)
       cout << a[i][j] << " ";
   cout << "\n";
}
```
is equivalent to this:
```
for(i = 1; i <= n; i++)
   for(j = 1; j <= m; j++)
       cout << a[i][j] << " \n"[j == m];
```
Loop at next level
```
#define rep(i, begin, end) for (__typeof(end) i = (begin) - ((begin) > (end)); i != (end) - ((begin) > (end)); i += 1 - 2 * ((begin) > (end)))
 
int main()
{
   int n = 10;
   rep(i, n, 0)
       cout<< i << endl;
 
   rep(i, 0, 5)
       cout<< i << endl;
 
   vector<ll> v = {1, 2, 3, 4, 5};
 
   rep(it, end(v), begin(v))
       cout << *it << endl;
 
   return 0;
}
```






