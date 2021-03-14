TODO: Problems on set data structure including set_unioin & set_intersection like algo. E.g. finding elements that exist in one container while not in other.

## Guidelines to solve following problems.
- Try to avoid raw loops as much as possible, although its inevitable.
- Intention of this exercise is to make you aware about STL algos, so try to find available & ready made algo from STL to solve following problems, this way you will get to know type of algos, how to use them & where to apply those.
- Code should be compilable & neat, with comments(if required).
- Try to write one-liner as there are already STL functions available for most of the problems, although that's not possible all the time & not necessary too. But just to see how much we can make code compact. Lesser the code, lesser the bugs.
- Try to write generic code so that even if input changes, your code will takle it.

### Prerequisites
- https://www.youtube.com/watch?v=g-1Cn3ccwXY
- https://www.youtube.com/watch?v=qOHXdhtxyyQ
- https://www.youtube.com/watch?v=7qZ2O5-uLO8
- https://www.bfilipek.com/2014/12/top-5-beautiful-c-std-algorithms.html
- http://sandordargo.com/tags/#stl

### Slide to postition
```C++
vector<string> slide_to_pos(vector<string> &words, uint32_t pos) {
	std::function<bool(const string &)> pred = [](const string &str) {
		return str[0] == 't';
	};
	auto partition_point = std::begin(words) + pos;

	std::stable_partition(std::begin(words), partition_point, std::not1(pred));
	std::stable_partition(partition_point, std::end(words), pred);

	return words;
}

int main() {
	vector<string> words{
		"disagree",
		"temporary",
		"useful",
		"third",
		"permissible",
		"thesis",
		"disgusted",
		"cub",
		"type",
		"satisfy",
	};

	assert((slide_to_pos(words, 5) == vector<string>{"disagree",
													 "useful",
													 "permissible",
													 "temporary",
													 "third",
													 "thesis",
													 "type",
													 "disgusted",
													 "cub",
													 "satisfy"}));

	return EXIT_SUCCESS;
}
```

### Slide the words having specific character count to beginning of list
```C++
vector<string> slide_to_begin(vector<string> &words, uint32_t char_cnt) {
	vector<string> result;
	// Your Code
	return result;
}

int main() {
	vector<string> words{
		"disagree",
		"temporary",
		"useful",
		"third",
		"permissible",
		"satisfy",
		"disgusted",
		"cub",
		"cooing",
		"wrong",
	};

	assert((slide_to_begin(words, 5) == vector<string>{
											"third",
											"cub",
											"wrong",
											"disagree",
											"temporary",
											"useful",
											"permissible",
											"satisfy",
											"disgusted",
											"cooing",
										}));

	return EXIT_SUCCESS;
}

```

- solution std::stable_partition

### Slide the content of list to end

```c++
vector<string> slide_to_last(vector<string> &words, uint32_t start, uint32_t end) {
	vector<string> result;
	// Your Code
	return result;
}


int main() {
	vector<string> words{
		"disagree",
		"temporary",
		"useful",
		"third",
		"permissible",
		"satisfy",
		"disgusted",
		"cub",
		"cooing",
		"wrong",
	};

	assert(slide(words, 0, 0) == {
									 "temporary",
									 "useful",
									 "third",
									 "permissible",
									 "satisfy",
									 "disgusted",
									 "cub",
									 "cooing",
									 "wrong",
									 "disagree",
								 });

	assert(slide(words, 2, 3) == {
									 "disagree",
									 "temporary",
									 "satisfy",
									 "disgusted",
									 "cub",
									 "cooing",
									 "wrong",
									 "useful",
									 "third",
									 "permissible",
								 });

	return EXIT_SUCCESS;
}
```
- Solution std::rotate

### Insertion Sort using STL
- 
```c++
for (auto i = start; i != end; ++i)
    std::rotate(std::upper_bound(start, i, *i), i, std::next(i));
```

### Selection Sort using STL
- 
```c++
template <class It, class C> void selection_sort(It first, It last, C comp) {
    for (auto it = first; it != last - 1; ++it) {
        iter_swap(it, min_element(it, last, comp));
    }
}

template <class It> void selection_sort(It first, It last) {
    selection_sort(first, last, std::less<std::decay_t<decltype(*first)>>());
}
```


### Quick Sort using STL
- 
```c++
template<class FwdIt, class Compare = std::less<>>
void quickSort(FwdIt first, FwdIt last, Compare cmp = Compare{})
{
    auto const N = std::distance(first, last);
    if (N <= 1) return; 
    auto const pivot = std::next(first, N / 2);
    std::nth_element(first, pivot, last, cmp);
    quickSort(first, pivot, cmp); 
    quickSort(pivot, last, cmp); 
}
```


### Replace first n numbers.
- Replace all the 3 with -1
```c++
int main()
{
std::vector<int> numbers { 1, 2, 3, 4, 5, 4, 7, 4, 9, 10 };


}
```
- Solution 1
```c++
std::replace_if(numbers.begin(), numbers.end(), [i = 0](auto number) mutable {return number == 4 && i++ < 2;}, 3);
```
- Solution 2
```c++
try {
    std::replace_if(numbers.begin(), numbers.end(), [i = 0](auto number) mutable {
        if (i == 2) {
            throw std::invalid_argument{"Already replaced " + std::to_string(i) + " elements"};
        }
        return number == 4 && i++ < 2;
    }, 42);
} catch (const std::exception& ex) {
    std::cout << "Done with replacing: " << ex.what() << std::endl;
}
```
- Solution 3
```c++
template <typename T, typename Iter>
Iter replace_n(Iter begin, Iter end, T oldValue, T newValue, size_t n) {
   for (size_t i = 0; i < n; ++i) {
    begin = std::find(begin, end, 4);
    std::replace(begin, begin+1, 4, 42);
    std::advance(begin,1);
  }
  return begin;
}

```
- Output
```

```


### Split the string using delimiter `-`.
```c++
int main()
{
    string str = "1-2-3-4-5-6-7-8-9";
    
    return 0;
}
```
- Output
```
1
2
3
4
5
6
7
8
9
```

### Capitalize the following string.
```c++
int main()
{
    string str = "this is that";
    
    return 0;
}
```
- Output
```
THIS IS THAT
```

### Delete all the `1`s from following containers, try to delete it using for loop.
```c++
int main()
{
    std::vector<int> v = {1, 2, 7, 3, 1, 1, 1, -1, 1, 3, 9, 4, 5, 6, 1, 8, 7};
    
    // Your code
  
    
    std::set<int> s = {1, 2, 7, 3, 1, 1, 1, -1, 1, 3, 9, 4, 5, 6, 1, 8, 7};
    
    // Your code
    
    std::list<int> l = {1, 2, 7, 3, 1, 1, 1, -1, 1, 3, 9, 4, 5, 6, 1, 8, 7};
    
    // Your code
    
    return 0;
}
```
- Output
```
2, 7, 3, -1, 3, 9, 4, 5, 6, 8, 7
```

### Remove the duplicate characters from string
```c++
int main()
{
    string input_string = "aaabcddcbeef";
    
    // Your code
    
    return 0;
}
```
- Output
```
abcdef
```

### Remove space from C++ string using STL

```c++
int main()
{
    string input_string = "1         2  3   4 5 55 5     ";
    
    // Your code
    
    return 0;
}
```
- Output
```
12345555
```
### Sort the words lexicographically
```c++
int main()
{
    std::vector<string> words = {"Python", "C", "C++", "JAVA", "C_Sharp", "ASSEMBLY", "FORTRAN", "HTML", "NODEjs"};
    
    // Your code
    
    return 0;
}
```
- Output
```
ASSEMBLY
C
C_Sharp
C++
FORTRAN
HTML
JAVA
NODEjs
Python
```
### Answer following queries for sorted vector
```c++
int main()
{
    std::vector<int> v = {-11, -2, -3, -1, 1, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 9};
    
    // Your code
    
    return 0;
}
```
- How many time 5 is repeated?
- How many negative elements are there?
- Insert 2 at appropriate location to maintain container sorted.
- Remove all elements between 2nd index to 6th index.
- Remove all the elements greater than & equal to 5.

### Given an array and a number K where K is smaller than size of array, we need to find the K’th smallest element in the given array. In other words, K'th smallest elements is K'th position in the array that after sorting array.

```c++
int main()
{
    std::vector<int> v = {7, 10, 4, 3, 20, 15};
    
    // Your code
    
    return 0;
}
```
- Input
```
3
4
```

- Output
```
7
10
```
### Answer following queries for set**
```c++
int main()
{
    std::set<int> s = {10, -11, 0, -3, -1, 1, 3, 2, 3, -2, 4, 5, 5, 3, 5, 6, 7, 8, 9};
    
    // Your code
    
    return 0;
}
```
- How many time 5 is repeated?
- How many elements are less than 5?
- How many negative elements are there?

### How many numbers are less than or greater than current number at give time ?

- `+` means add number to data structure, `<` means query followed by number to find out lesser numbers in value in data structure, and same goes for `>`.
```c++
int main()
{    
    // Your code
    
    return 0;
}
```
- input
```
+ 5
+ 7
+ 9
+ 9
< 10
+ 14
+ 6
+ 2
+ 1
+ 1
> 5
+ 13
+ 6
+ 25
< 20
+ 8
+ 77
+ 9
```
- output
```
4
5
11
```

### Check for balanced parentheses in an expression also find maximum depth of nested parenthesis
```c++
int main()
{
    string balanced = "[()]{}{[()()]()}";
    // string not_balanced = "[(])"; 
    
    // Your code
    
    return 0;
}
```
- Output
```

```

### Breadth First Search Algorithm: Print the nodes of following tree layer-by-layer

```
/* 
                 0           Layer 0
                /  \         
               /    \        
              1      2       Layer 1
             / \    / \      
            3   4  5   6     Layer 2
*/
```
```c++
struct node
{
    int m_data;
    node *left;
    node *right;
    node(int data) : m_data(data) {}
};

int main()
{
    // Layer 0
    node *root = new node(0);

    // Layer 1
    root->left = new node(1);
    root->right = new node(2);

    // Layer 2
    root->left->left = new node(3);
    root->left->right = new node(4);

    root->right->left = new node(5);
    root->right->right = new node(6);

    return 0;
}
```
- Output
```
0 1 2 3 4 5 6
```

### Design interrupt controller
```c++
struct irq_data
{
    uint32_t irqNo;
    uint32_t priority;
};

class interrupt_controller
{

    /* data structure */
public:
    interrupt_controller() = default;
    ~interrupt_controller() = default;

    /* Store IRQ data */
    void push(uint32_t irqNo, uint32_t priority)
    {
        // TODO
    }

    /* Return highest priority IRQ */
    irq_data top()
    {
        // TODO
    }

    /* Removes highest priority IRQ */
    void pop()
    {
        // TODO
    }
};

int main()
{
    interrupt_controller ic;

    ic.push(32, 4);
    ic.push(33, 2);
    ic.push(30, 0);

    cout << ic.top().irqNo << endl; ic.pop(); // 30
    cout << ic.top().irqNo << endl; ic.pop(); // 33
    return 0;
}
```
- NOTE: lower the number, higher the priority.
- Output
```
30
33
```

### Find min element in continuous input sequence
```c++
TODO
```

### Sort the list of numbers based on its frequency of occurrence
```c++
int main()
{
    std::vector<int> v = {2, 5, 2, 1, 3, 2, 4, 5, 2, 7, 4, 2, 3, 5, 7, 5, 4, 3, 5, 5, 4};
    
    // Your code
    
    return 0;
}
```
- Output
```
5 5 5 5 5 5 2 2 2 2 2 4 4 4 4 3 3 3 7 7 1 
```

### Given a array of size N and an integer K, you have to find the maximum integer for each and every contiguous subarray of size K for each of the given arrays
```c++
int main()
{   
    // Your code
    
    return 0;
}
```
- Input
```
7 4
3 4 5 8 1 4 10
```
- Output
```
8 8 8 10
```
Exaplanations: The contiguous subarrays of size 4 are {3,4,5,8},{4,5,8,1},{5,8,1,4} and {8,1,4,10}. The 4 maximum element of subarray of size 4 are: 8 8 8 10.


### Optimize the following codes by choosing appropriate algo. Segregate the 0's & 1's. Put all the zeros in beginning.
```c++
int main() {

    vector<int> v{0, 1, 1, 0, 0, 1};

    uint16_t s = 0;
    uint16_t e = v.size()-1;

    while(s < e){
        if(v[s] == 0)
            s++;
        else if(v[e] == 1)
            e--;
        else
            swap(v[s], v[e]);
    }

    std::copy(begin(v), end(v), ostream_iterator<int>(cout," ") );
    cout<<"\nTotal zeros are : "<<s<<endl;

    return 0;
}
```
- Brain teaser: What if we wants to segregate 0's, 1's, 2's, 3's?
- output
```
0 0 0 1 1 1 
Total zeros are : 3
```
### Check if following vectors are same or not, if not, then find the common elements
```c++
// This file is a "Hello, world!" in C++ language by GCC for wandbox.
#include <iostream>
#include <bits/stdc++.h>
using namespace std;

/*
    v1 = 1,2,3,4
    v2 = 1,2,3,4

    v1 & v2 is same & equal

    v1 = 1,4,3,2
    v2 = 3,2,1,4

    v1 & v2 is equal, but not same
 */

vector<int> find_diff(vector<int>& v1, vector<int>& v2)
{
    vector<int> extra;

    bool is_same = true;
    for (size_t i = 0; i < v1.size(); i++)
    {
        if(v1[i]!=v2[i])
            is_same = false;
    }

    if(is_same) cout<<" SAME "<< endl;
    else cout<<" NOT SAME "<< endl;

    map<int, int> cnt;

    for (auto &&i1 : v1)
        cnt[i1]++;

    for (auto &&i2 : v2)
        cnt[i2]++;
        
    auto c = count_if(begin(cnt), end(cnt), [](auto &p){return p.second == 2;});
    if(c==v1.size()) cout<<" EQUAL "<< endl;
    else cout<<" NOT EQUAL "<< endl;

    for (auto &&pair : cnt)
    {
        if(pair.second!=1)
            extra.push_back(pair.first);
    }


    return extra;
}


int main() {
    vector<int> v1{4};
    iota(begin(v1), end(v1), 1);
    vector<int> v2(begin(v1), end(v1));

    vector<int> extra1 = find_diff(v1, v2);
    std::copy(begin(extra1),  end(extra1),  ostream_iterator<int>(cout, " ") ); cout<<endl;
    
    cout<<"=========================================="<<endl;
    
    vector<int> v5{1,4,3,2};
    vector<int> v6{3,1,2,4};

    vector<int> extra3 = find_diff(v5, v6);
    std::copy(begin(extra3),  end(extra3),  ostream_iterator<int>(cout, " ") ); cout<<endl;

    cout<<"=========================================="<<endl;

    vector<int> v3{1,4,3,2};
    vector<int> v4{3,7,5,4};

    vector<int> extra2 = find_diff(v3, v4);
    std::copy(begin(extra2),  end(extra2),  ostream_iterator<int>(cout, " ") ); cout<<endl;

    cout<<"=========================================="<<endl;

    return 0;
}
```
- output
```
```

### Optimize the following codes by choosing appropriate algo
```c++
#include <iostream>
#include <bits/stdc++.h>
using namespace std;

vector<int> return_square_if_in_range(vector<int>& v, int start, int end)
{
    bool is_in_range = false;
    
    vector<int> result;
    
    for(auto&& i:v)
    {
        if(i>=start && i<=end)
        {
            is_in_range = true;
            break;
        }
    }
    
    if(is_in_range)
    {
        for(auto&& i:v)
        {
            result.push_back(i*i);
        }
    }
    
    return result;
}


int main() {
    vector<int> v{9,7,8,1,2,3,4,5,6};
    
    vector<int> result = return_square_if_in_range(v, 2, 5);
    std::copy(begin(result),  end(result),  ostream_iterator<int>(cout, " ") ); cout<<endl;
    cout<<"======================================"<<endl;

    result = return_square_if_in_range(v, 12, 15);
    std::copy(begin(result),  end(result),  ostream_iterator<int>(cout, " ") ); cout<<endl;
    cout<<"======================================"<<endl;



    return 0;
}
```
- output
```
```

### Use STL function instead of raw for loop to find the minimum difference between any two elements in a sorted sequence of numbers

- For example:
```c++
[10, 20, 40, 100, 200, 300, 1000]
```
The minimum difference is 10, that is 20-10. Any other combination is greater. 
```c++
int main()
{
    int minDiff = numeric_limits<int>::max();
    vector<int> v{10, 20, 40, 100, 200, 300, 1000};

    for (size_t i = 0; i < v.size() - 1; ++i)
    {
        minDiff = min(v[i + 1] - v[i], minDiff);
    }

    cout << minDiff << endl;

    return 0;
}
```
- output
```
10
```


### Count the number of equal adjacent characters in a string:

ABAAACCBDBB

That is 4:

ABA**AA**C**C**BDB**B**
```c++
int main()
{
    string str = "ABAAACCBDBB";

    return 0;
}
```
- output
```
4
```


### Given a string S, consisting of N lowercase English letters, reduce S as much as possible by deleting any pair of adjacent letters with the same value. N is at most 100.

For example:

aabccbdea

becomes "dea", since we can first delete "aa" getting:

bccbdea

Then we delete "cc" and get: "bbdea", finally we remove "bb" and get "dea".
```c++
int main()
{
    string s = "aabccbdea";

    return 0;
}
```
- output
```
```

### Check if string is palindrom or not?
```c++
int main()
{
    string s = "aabaa";

}
```
- output
```
```


### Design custome allocator for following main program & observe the allocation & deallocation size. Justify the reason behind it.
```c++

struct my_alloc
{
    // Complete this
};

int main() // Do not change main program
{
    vector<int, my_alloc<int>> v;
    
    v.push_back(1);
    v.push_back(2);
    v.push_back(3);
    v.push_back(4);
    v.push_back(5);
    v.push_back(6);
    v.push_back(7);
    v.push_back(8);
    v.push_back(9);
    v.push_back(10);
    v.push_back(11);
    v.push_back(12);
    v.push_back(13);
    v.push_back(14);
    v.push_back(15);
    v.push_back(16);
    v.push_back(17);
    v.push_back(18);
    v.push_back(19);
    v.push_back(20);
    
    return 0;
}

```
- Note: I would suggest you to use same allocator for deque as well.
- output
```
```



> **11.  **
```c++
```
- output
```
```
> **12.  **
```c++
```
- output
```
```
> **13.  **
```c++
```
- output
```
```
> **14.  **
```c++
```
- output
```
```
> **15.  **
```c++
```
- output
```
```
> **16.  **
```c++
```
- output
```
```
> **17.  **
```c++
```
- output
```
```
> **18.  **
```c++
```
- output
```
```

Given an array A of non=negative integers, returns an array consisting of all the even elements of A, followed by all the odd elements of A.
std::partition & std::unique, but std::partition is linear complexity

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
std::stable_partition

We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
(Here, the distance between two points on a plane is the Euclidean distance.)
You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
std::sort, std::partial_sort & std::nth_element(fast)

Search in Rotated Sorted Array
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
You are given a target value to search. If found in the array return its index, otherwise return -1.
You may assume no duplicate exists in the array.
Your algorithm's runtime complexity must be in the order of O(log n).
std::is_sorted_until + std::binary_search
std::partition_point + std::binary_search

Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.
Input: "1ab2cd"
Output: "1dc2ba"
copy_if + reverse + transform, partition
