"""Lab 2: Lambda Expressions and Higher Order Functions"""

# Lambda Functions

def lambda_curry2(func):
    """
    Returns a Curried version of a two-argument function FUNC.
    >>> from operator import add, mul, mod
    >>> curried_add = lambda_curry2(add)
    >>> add_three = curried_add(3)
    >>> add_three(5)
    8
    >>> curried_mul = lambda_curry2(mul)
    >>> mul_5 = curried_mul(5)
    >>> mul_5(42)
    210
    >>> lambda_curry2(mod)(123)(10)
    3
    """
    "*** YOUR CODE HERE ***"
    #def f1(x):
    #    def f2(y):
    #        return func(x,y)
    #    return f2
    #return f1
    return lambda x: lambda y:func(x,y)


def count_cond(condition):
    """Returns a function with one parameter N that counts all the numbers from
    1 to N that satisfy the two-argument predicate function Condition, where
    the first argument for Condition is N and the second argument is the
    number from 1 to N.

    >>> count_factors = count_cond(lambda n, i: n % i == 0)
    >>> count_factors(2)   # 1, 2
    2
    >>> count_factors(4)   # 1, 2, 4
    3
    >>> count_factors(12)  # 1, 2, 3, 4, 6, 12
    6

    >>> is_prime = lambda n, i: count_factors(i) == 2
    >>> count_primes = count_cond(is_prime)
    >>> count_primes(2)    # 2
    1
    >>> count_primes(3)    # 2, 3
    2
    >>> count_primes(4)    # 2, 3
    2
    >>> count_primes(5)    # 2, 3, 5
    3
    >>> count_primes(20)   # 2, 3, 5, 7, 11, 13, 17, 19
    8
    """
    "*** YOUR CODE HERE ***"

    def inner(x):
        increment=1
        counter=0
        while(increment<=x):
            if condition(x,increment):
                counter+=1
            increment+=1
        return counter
    return inner
def both_paths(sofar="S"):
    """
    >>> left, right = both_paths()
    S
    >>> leftleft, leftright = left()
    SL
    >>> rightleft, rightright = right()
    SR
    >>> _ = leftleft()
    SLL
    """
    "*** YOUR CODE HERE ***"

    print(sofar)
    def left():
        #you are actually calling both_paths until left is called
        return both_paths(sofar+"L")
    def right():
        #you are actually calling both_paths until left is called
        return both_paths(sofar+"R")
    #each time left() or right is called, each of them will return a nother left and right functuin, very smart solution
    return left,right
