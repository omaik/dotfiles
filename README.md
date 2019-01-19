# My dotfiles

```java
public static List<Integer> sieveOfEratosthenes(int n) {
    boolean prime[] = new boolean[n + 1];
    Arrays.fill(prime, true);
    for (int p = 2; p * p <= n; p++) {
        if (prime[p]) {
            for (int i = p * 2; i <= n; i += p) {
                prime[i] = false;
            }
        }
    }
    List<Integer> primeNumbers = new LinkedList<>();
    for (int i = 2; i <= n; i++) {
        if (prime[i]) {
            primeNumbers.add(i);
        }
    }
    return primeNumbers;
}
```

```ruby
def primes(num)
  (1..num).select do |number|
    prime?(number)
  end
end

def prime?(num)
  2.upto(num/2) do |n|
    break false if (num%n).zero?
  end
end
```
 
